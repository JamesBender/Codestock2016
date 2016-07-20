using System;

namespace Common
{
    public class PropertyInjectedLoggingComponent : ILoggingComponent
    {
        public string Execute()
        {
            return "special log";
        }
    }
}