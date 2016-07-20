Feature: ServiceClass
	In order to test the service class logic
	while NOT running it as an actual service
	I want to call the serivce logic methods
	And make sure I get the results
	again, this IS NOT running as a service, so you will not get a SOAP message back

Scenario: Call the test method on the shipping service
	Given I am using the shipping service class
	When I call the test method
	Then I should get a valid result

Scenario: Call Shipping Service with test data set 0
	Given I am using the shipping service class
	And I have a request with this header data
		| shipment Id | call ahead | cod   | cod amount | lift gate | residential | saturday delivery | zip code |	
		| WSP0805959S  | false      | false | 0          | true      | false       | false             | 47842    |
	And the following order items
	| item number | item quantity | free shipping |
	| AG0015      | 1             | true         |
	| AG1414      | 1             | true         |
	When I get the shipping rates from the shipping service
	Then I should get these shipping options
	| Shipper             | RateName | SHIPMTHD   | Rate   | TotalCartons | TotalPallets | TotalWeight |
	| FedEx Ground        | Ground   | FEDEXGRND  | 22.78  | 2            | 0            | 6.400       |
	| FedEx Second Day    | 2Day     | FEDEX2DAY  | 32.71  | 2            | 0            | 6.400       |
	| FedEx Next Day      | Priority | FEDEXPRIOV | 48.45  | 2            | 0            | 6.400       |
	| R&L Carriers        | LTL      | RLCARRIERS | 89.57  | 2            | 0            | 6.400       |
	| Dayton Freight      | LTL      | DAYTONFRT  | 91.86  | 2            | 0            | 6.400       |
	| FEDEx National      | LTL      | FEDXNAT    | 152.45 | 2            | 0            | 6.400       |
	| FedEx Freight Lines | LTL      | FEDXFRT    | 156.35 | 2            | 0            | 6.400       |
		

Scenario: Call Shipping Service with test data set 1
	Given I am using the shipping service class
	And I have a request with this header data
		| shipment Id | call ahead | cod   | cod amount | lift gate | residential | saturday delivery | zip code |
		| WSP0805967S  | false      | false | 0          | true      | false       | false             | 92701    |
	And the following order items
	| item number | item quantity | free shipping |
	| GG0513      | 1             | true         |
	When I get the shipping rates from the shipping service
	Then I should get these shipping options
	| Shipper             | RateName | SHIPMTHD   | Rate   | TotalCartons | TotalPallets | TotalWeight |
	| R&L Carriers        | LTL      | RLCARRIERS | 145.47 | 1            | 0            | 125.000     |
	| FEDEx National      | LTL      | FEDXNAT    | 185.71 | 1            | 0            | 125.000     |
	| FedEx Freight Lines | LTL      | FEDXFRT    | 186.84 | 1            | 0            | 125.000     |

		
Scenario: Call Shipping Service with test data set 2
	Given I am using the shipping service class
	And I have a request with this header data
		| shipment Id | call ahead | cod   | cod amount | lift gate | residential | saturday delivery | zip code |
		| WSP0805969S  | false      | false | 0          | true      | false       | false             | 13367    |
	And the following order items
	| item number | item quantity | free shipping |
	| BE6670      | 1             | true         |
	| LA6553      | 1             | true         |
	When I get the shipping rates from the shipping service
	Then I should get these shipping options
	| Shipper             | RateName | SHIPMTHD   | Rate   | TotalCartons | TotalPallets | TotalWeight |
	| FedEx Ground        | Ground   | FEDEXGRND  | 11.39  | 1            | 0            | 2.000       |
	| FedEx Second Day    | 2Day     | FEDEX2DAY  | 16.36  | 1            | 0            | 2.000       |
	| FedEx Next Day      | Priority | FEDEXPRIOV | 28.77  | 1            | 0            | 2.000       |
	| R&L Carriers        | LTL      | RLCARRIERS | 89.57  | 1            | 0            | 2.000       |
	| FEDEx National      | LTL      | FEDXNAT    | 152.45 | 1            | 0            | 2.000       |
	| FedEx Freight Lines | LTL      | FEDXFRT    | 156.35 | 1            | 0            | 2.000       |

		
Scenario: Call Shipping Service with test data set 3
	Given I am using the shipping service class
	And I have a request with this header data
		| shipment Id | call ahead | cod   | cod amount | lift gate | residential | saturday delivery | zip code |
		| WSP0805972S  | false      | false | 0          | true      | false       | false             | 48801    |
	And the following order items
	| item number | item quantity | free shipping |
	| 419905      | 1             | true         |
	| JC1813      | 2             | true         |
	When I get the shipping rates from the shipping service
	Then I should get these shipping options
	| Shipper             | RateName | SHIPMTHD   | Rate   | TotalCartons | TotalPallets | TotalWeight |
	| FedEx Ground        | Ground   | FEDEXGRND  | 22.78  | 2            | 0            | 14.400      |
	| FedEx Second Day    | 2Day     | FEDEX2DAY  | 34.38  | 2            | 0            | 14.400      |
	| FedEx Next Day      | Priority | FEDEXPRIOV | 57.94  | 2            | 0            | 14.400      |
	| R&L Carriers        | LTL      | RLCARRIERS | 89.57  | 2            | 0            | 14.400      |
	| Dayton Freight      | LTL      | DAYTONFRT  | 91.86  | 2            | 0            | 14.400      |
	| FEDEx National      | LTL      | FEDXNAT    | 152.45 | 2            | 0            | 14.400      |
	| FedEx Freight Lines | LTL      | FEDXFRT    | 156.35 | 2            | 0            | 14.400      |

		
Scenario: Call Shipping Service with test data set 4
	Given I am using the shipping service class
	And I have a request with this header data
		| shipment Id | call ahead | cod   | cod amount | lift gate | residential | saturday delivery | zip code |
		| WSP0805980S  | false      | false | 0          | true      | false       | false             | 11220    |
	And the following order items
	| item number | item quantity | free shipping |
	| 150300      | 1             | true         |
	When I get the shipping rates from the shipping service
	Then I should get these shipping options
	| Shipper             | RateName | SHIPMTHD   | Rate   | TotalCartons | TotalPallets | TotalWeight |
	| FedEx Ground        | Ground   | FEDEXGRND  | 16.98  | 1            | 0            | 52.500      |
	| FedEx Second Day    | 2Day     | FEDEX2DAY  | 77.59  | 1            | 0            | 52.500      |
	| FedEx Freight Lines | LTL      | FEDXFRT    | 246.07 | 0            | 1            | 106.667     |
	| FEDEx National      | LTL      | FEDXNAT    | 256.31 | 0            | 1            | 106.667     |
	| FedEx Next Day      | Priority | FEDEXPRIOV | 182.39 | 1            | 0            | 52.500      |
	| R&L Carriers        | LTL      | RLCARRIERS | 207.16 | 0            | 1            | 106.667     |

		
Scenario: Call Shipping Service with test data set 5
	Given I am using the shipping service class
	And I have a request with this header data
		| shipment Id | call ahead | cod   | cod amount | lift gate | residential | saturday delivery | zip code |
		| WSP0805985S  | false      | false | 0          | true      | false       | false             | 84066    |
	And the following order items
	| item number | item quantity | free shipping |
	| 417005      | 1             | true         |
	| 417015      | 1             | true         |
	| 741220      | 1             | true         |
	| 744009      | 4             | true         |
	| BA6024      | 1             | true         |
	| BA6306      | 1             | true         |
	When I get the shipping rates from the shipping service
	Then I should get these shipping options
	| Shipper             | RateName | SHIPMTHD   | Rate   | TotalCartons | TotalPallets | TotalWeight |
	| R&L Carriers        | LTL      | RLCARRIERS | 398.45 | 4            | 2            | 562.150     |
	| FEDEx National      | LTL      | FEDXNAT    | 422.28 | 4            | 2            | 562.150     |
	| FedEx Freight Lines | LTL      | FEDXFRT    | 464.73 | 4            | 2            | 562.150     |

		
Scenario: Call Shipping Service with test data set 6
	Given I am using the shipping service class
	And I have a request with this header data
		| shipment Id | call ahead | cod   | cod amount | lift gate | residential | saturday delivery | zip code |
		| WSP0805993S  | false      | false | 0          | true      | false       | false             | 43081    |
	And the following order items
	| item number | item quantity | free shipping |
	| 418003      | 2             | true         |
	| BR2129      | 2             | true         |
	When I get the shipping rates from the shipping service
	Then I should get these shipping options
	| Shipper             | RateName    | SHIPMTHD   | Rate   | TotalCartons | TotalPallets | TotalWeight |
	| R&L Carriers        | LTL         | RLCARRIERS | 90.57  | 0            | 1            | 300.300     |
	| Dayton Freight      | LTL         | DAYTONFRT  | 92.86  | 0            | 1            | 300.300     |
	| FEDEx National      | LTL         | FEDXNAT    | 153.45 | 0            | 1            | 300.300     |
	| FedEx Freight Lines | LTL         | FEDXFRT    | 157.35 | 0            | 1            | 300.300     |
	| FedEx Ground        | Ground      | FEDEXGRND  | 212.02 | 4            | 0            | 250.300     |
	| FedEx Second Day    | 2Day        | FEDEX2DAY  | 328.75 | 4            | 0            | 250.300     |
	| FedEx Next Day      | Priority    | FEDEXPRIOV | 437.70 | 4            | 0            | 250.300     |
	| FedEx Mutiweight    | multiweight | FEDEXMLTWT | 506.00 | 4            | 0            | 250.300     |

		
Scenario: Call Shipping Service with test data set 7
	Given I am using the shipping service class
	And I have a request with this header data
		| shipment Id | call ahead | cod   | cod amount | lift gate | residential | saturday delivery | zip code |
		| WSP0806001S  | false      | false | 0          | true      | false       | false             | 16509    |
	And the following order items
	| item number | item quantity | free shipping |
	| GH5550      | 1             | true         |
	When I get the shipping rates from the shipping service
	Then I should get these shipping options
	| Shipper             | RateName | SHIPMTHD   | Rate   | TotalCartons | TotalPallets | TotalWeight |
	| FedEx Ground        | Ground   | FEDEXGRND  | 9.19   | 1            | 0            | 7.200       |
	| FedEx Second Day    | 2Day     | FEDEX2DAY  | 14.52  | 1            | 0            | 7.200       |
	| FedEx Next Day      | Priority | FEDEXPRIOV | 26.90  | 1            | 0            | 7.200       |
	| R&L Carriers        | LTL      | RLCARRIERS | 89.57  | 1            | 0            | 7.200       |
	| Dayton Freight      | LTL      | DAYTONFRT  | 91.99  | 1            | 0            | 7.200       |
	| FEDEx National      | LTL      | FEDXNAT    | 152.45 | 1            | 0            | 7.200       |
	| FedEx Freight Lines | LTL      | FEDXFRT    | 156.35 | 1            | 0            | 7.200       |

		
Scenario: Call Shipping Service with test data set 8
	Given I am using the shipping service class
	And I have a request with this header data
		| shipment Id | call ahead | cod   | cod amount | lift gate | residential | saturday delivery | zip code |
		| WSP0806012S  | false      | false | 0          | true      | false       | false             | 01128    |
	And the following order items
	| item number | item quantity | free shipping |
	| KX0028      | 1             | true         |
	When I get the shipping rates from the shipping service
	Then I should get these shipping options
	| Shipper      | RateName | SHIPMTHD   | Rate  | TotalCartons | TotalPallets | TotalWeight |
	| R&L Carriers | LTL      | RLCARRIERS | 90.57 | 0            | 1            | 142.222     |

		
Scenario: Call Shipping Service with test data set 9
	Given I am using the shipping service class
	And I have a request with this header data
		| shipment Id | call ahead | cod   | cod amount | lift gate | residential | saturday delivery | zip code |
		| WSP0805997S  | false      | false | 0          | true      | false       | false             | 43348    |
	And the following order items
	| item number | item quantity | free shipping |
	| KX0084      | 32            | true         |
	| KX0086      | 32            | true         |
	When I get the shipping rates from the shipping service
	Then I should get these shipping options
	| Shipper             | RateName | SHIPMTHD   | Rate    | TotalCartons | TotalPallets | TotalWeight |
	| R&L Carriers        | LTL      | RLCARRIERS | 206.09  | 0            | 9            | 2450.000    |
	| FEDEx National      | LTL      | FEDXNAT    | 297.84  | 0            | 9            | 2450.000    |
	| FedEx Freight Lines | LTL      | FEDXFRT    | 310.91  | 0            | 9            | 2450.000    |
	| FedEx Ground        | Ground   | FEDEXGRND  | 2833.15 | 36           | 0            | 656.100     |
	| FedEx Second Day    | 2Day     | FEDEX2DAY  | 5040.61 | 36           | 0            | 656.100     |
	| FedEx Next Day      | Priority | FEDEXPRIOV | 6817.79 | 36           | 0            | 656.100     |

		
Scenario: Call Shipping Service with test data set 10
	Given I am using the shipping service class
	And I have a request with this header data
		| shipment Id | call ahead | cod   | cod amount | lift gate | residential | saturday delivery | zip code |
		| WSP0806165S  | false      | false | 0          | true      | false       | false             | 94022    |
	And the following order items
	| item number | item quantity | free shipping |
	| 300306      | 2             | true         |
	| 304603      | 2             | true         |
	| HU0010      | 6             | true         |
	When I get the shipping rates from the shipping service
	Then I should get these shipping options
	| Shipper             | RateName | SHIPMTHD   | Rate    | TotalCartons | TotalPallets | TotalWeight |
	| FEDEx National      | LTL      | FEDXNAT    | 1433.78 | 2            | 8            | 2890.000    |
	| FedEx Freight Lines | LTL      | FEDXFRT    | 1635.56 | 2            | 8            | 2890.000    |
	| R&L Carriers        | LTL      | RLCARRIERS | 1629.50 | 2            | 8            | 2890.000    |

		
Scenario: Call Shipping Service with test data set 11
	Given I am using the shipping service class
	And I have a request with this header data
		| shipment Id | call ahead | cod   | cod amount | lift gate | residential | saturday delivery | zip code |
		| WSP0806209S  | false      | false | 0          | true      | false       | false             | 45014    |
	And the following order items
	| item number | item quantity | free shipping |
	| 208025      | 4             | true         |
	| 840001      | 14            | true         |
	| 840002      | 14            | true         |
	| 840003      | 14            | true         |
	| 840005      | 14            | true         |
	| 842200      | 3             | true         |
	| 843022      | 11            | true         |
	| 990005      | 14            | true         |
	| DF1021      | 1             | true         |
	| DF4029      | 1             | true         |
	| KX1240      | 3             | true         |
	| KX1342      | 11            | true         |
	| MK0841      | 52            | true         |
	| MK1000      | 52            | true         |
	When I get the shipping rates from the shipping service
	Then I should get these shipping options
	| Shipper             | RateName | SHIPMTHD   | Rate   | TotalCartons | TotalPallets | TotalWeight |
	| R&L Carriers        | LTL      | RLCARRIERS | 188.97 | 11           | 5            | 1701.650    |
	| Dayton Freight      | LTL      | DAYTONFRT  | 217.69 | 11           | 5            | 1701.650    |
	| FEDEx National      | LTL      | FEDXNAT    | 246.73 | 11           | 5            | 1701.650    |
	| FedEx Freight Lines | LTL      | FEDXFRT    | 257.40 | 11           | 5            | 1701.650    |

Scenario: Call Shipping Service with Matts test data
	Given I am using the shipping service class
	And I have a request with this header data
		| shipment Id | call ahead | cod   | cod amount | lift gate | residential | saturday delivery | zip code |
		| WSP0806XXXX  | false      | false | 0          | true      | false       | false             | 43081    |
	And the following order items
	| item number | item quantity | free shipping |
	| 205540      | 1             | true         |
	When I get the shipping rates from the shipping service
	Then I should get these shipping options
	| Shipper             | RateName | SHIPMTHD   | Rate   | TotalCartons | TotalPallets | TotalWeight |
	| R&L Carriers        | LTL      | RLCARRIERS | 89.57  | 1            | 0            | 0.400       |
	| Dayton Freight      | LTL      | DAYTONFRT  | 91.86  | 1            | 0            | 0.400       |
	| FEDEx National      | LTL      | FEDXNAT    | 152.45 | 1            | 0            | 0.400       |
	| FedEx Freight Lines | LTL      | FEDXFRT    | 156.35 | 1            | 0            | 0.400       |
	| FedEx Ground        | Ground   | FEDEXGRND  | 9.19   | 1            | 0            | 0.400       |
	| FedEx Second Day    | 2Day     | FEDEX2DAY  | 14.52  | 1            | 0            | 0.400       |
	| FedEx Next Day      | Priority | FEDEXPRIOV | 17.29  | 1            | 0            | 0.400       |