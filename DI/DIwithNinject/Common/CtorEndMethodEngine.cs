using System;

namespace Common
{
    public class CtorEndMethodEngine : IBusinessEngine
    {
        private readonly ILoggingComponent _component;

        public CtorEndMethodEngine(ILoggingComponent component)
        {
            _component = component;
        }

        public string RunProcess()
        {
            Console.WriteLine(string.Format("Ran, returned {0}", _component.Execute()));
            return "done";
        }
    }
}