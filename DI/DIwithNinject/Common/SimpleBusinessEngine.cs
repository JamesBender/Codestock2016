using System;

namespace Common
{
    public class SimpleBusinessEngine : IBusinessEngine
    {
        private readonly ILoggingComponent _component;

        public SimpleBusinessEngine(ILoggingComponent component)
        {
            _component = component;
        }

        public virtual string RunProcess()
        {
            var returnValue = string.Format("Transaction run, {0}", _component.Execute());
            Console.WriteLine(returnValue);
            return returnValue;
        }
    }    
}
