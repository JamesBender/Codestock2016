using System;
using Common;

namespace Common
{
    public class ChildEngineA : ParentEngine
    {
        private readonly ILoggingComponent _component;

        public ChildEngineA(ILoggingComponent component)
        {
            _component = component;
        }

        public override string RunProcess()
        {
            Console.WriteLine("From Chile A : {0}", _component.Execute());
            return "done";
        }
    }
}