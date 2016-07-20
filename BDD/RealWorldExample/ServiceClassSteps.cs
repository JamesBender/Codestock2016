using System;
using System.Globalization;
using System.Linq;
using equippers.com.ALS.bean.v1_0;
using NUnit.Framework;
using TechTalk.SpecFlow;

namespace ALSRatingService.Specifications
{
    [Binding]
    public class ServiceClassSteps
    {
        private ALSRatingServices _shippingPriceService;
        private GetRatesRequest _request;
        private GetRatesResponse _response;

        [Given(@"I am using the shipping service class")]
        public void GivenIAmUsingTheShippingServiceClass()
        {
            if (_shippingPriceService == null)
            {
                _shippingPriceService = new ALSRatingServices();
            }
        }
        
        [Given(@"I have a request with this header data")]
        public void GivenIHaveARequestWithThisHeaderData(Table table)
        {
          _request = new GetRatesRequest();
            var row = table.Rows[0];

            _request.GetRatesIP = new GetRatesIPType {ShipmentHeader = new ShipmentHeaderType()};
            var header = _request.GetRatesIP.ShipmentHeader;

            header.ShipmentID = row["shipment Id"];
            header.CallAhead = Convert.ToBoolean(row["call ahead"]);
            header.COD = Convert.ToBoolean(row["cod"]);
            header.CODAmount = Convert.ToDecimal(row["cod amount"]);
            header.Liftgate = Convert.ToBoolean(row["lift gate"]);
            header.Residential = Convert.ToBoolean(row["residential"]);
            header.SatDelivery = Convert.ToBoolean(row["saturday delivery"]);
            header.Zipcode = row["zip code"];

        }
        
        [Given(@"the following order items")]
        public void GivenTheFollowingOrderItems(Table table)
        {
            var idx = 0;
            _request.GetRatesIP.ShipmentItemsList = new ShipmentItemType[table.Rows.Count];

            foreach (var shippingItem in table.Rows.Select(item => new ShipmentItemType
            {
                sku = item["item number"],
                quantity = item["item quantity"],
                //freeShipping = item["free shipping"]
            }))
            {
                _request.GetRatesIP.ShipmentItemsList[idx] = shippingItem;
                idx++;
            }
        }

        [When(@"I get the shipping rates from the shipping service")]
        public void WhenIGetTheShippingRatesFromTheShippingService()
        {
            _response = _shippingPriceService.GetRates(_request);
        }
        
        [Then(@"I should get these shipping options")]
        public void ThenIShouldGetTheseShippingOptions(Table table)
        {
            Assert.IsNotNull(_response);
            Assert.IsNotNull((_response.GetRatesOP));
            Assert.IsNotNull((_response.GetRatesOP.ShipmentMethodList), "No list of shipping methods returned");
            Assert.AreEqual(table.Rows.Count, _response.GetRatesOP.ShipmentMethodList.Length, "Incorrect number of shipping methods returned");
            var responseResult = _response.GetRatesOP.ShipmentMethodList;

            Console.WriteLine("Response fees --");
            foreach (var shipmentMethodType in responseResult)
            {
                Console.WriteLine("method: {0} - fee: {1}", shipmentMethodType.ShipMethod, shipmentMethodType.Cost);
            }
            Console.WriteLine("end of fees");


            foreach (var expectedResult in table.Rows)
            {
                var locatedResult =
                    responseResult.FirstOrDefault(y => y.Shipper.Trim() == expectedResult["Shipper"].Trim() &&
                                                       y.RateName.Trim() == expectedResult["RateName"].Trim() &&
                                                       y.ShipMethod.Trim() == expectedResult["SHIPMTHD"].Trim() &&
                                                       y.Cost.ToString(CultureInfo.InvariantCulture) ==
                                                       expectedResult["Rate"].Trim() &&
                                                       y.TotalCartons.ToString() ==
                                                       expectedResult["TotalCartons"].Trim() &&
                                                       y.TotalPallets.ToString() ==
                                                       expectedResult["TotalPallets"].Trim() &&
                                                       y.TotalWeight.ToString(CultureInfo.InvariantCulture) ==
                                                       expectedResult["TotalWeight"].Trim());

                Assert.IsNotNull(locatedResult,
                    "Expected Record not found:\r\n\tShipper: {0} | Rate Name: {1} | SHIPMTHD: {2} | Rate: {3} | Total Cartons: {4} | Total Pallets: {5} | Total Weight: {6}",
                    expectedResult["Shipper"].Trim(), expectedResult["RateName"].Trim(),
                    expectedResult["SHIPMTHD"].Trim(), expectedResult["Rate"].Trim(),
                    expectedResult["TotalCartons"].Trim(),
                    expectedResult["TotalPallets"].Trim(), expectedResult["TotalWeight"].Trim());
            }
        }

        [When(@"I call the test method")]
        public void WhenICallTheTestMethod()
        {
            _response = _shippingPriceService.Test();
        }

        [Then(@"I should get a valid result")]
        public void ThenIShouldGetAValidResult()
        {
            Assert.IsNotNull(_response);
            Assert.AreEqual(6, _response.GetRatesOP.ShipmentMethodList.Length);
            Assert.AreEqual("0", _response.GetRatesOP.ResultCode);
        }

    }
}