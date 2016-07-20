using System;

namespace Common
{
    public class OffLineLoggingComponent : ILoggingComponent
    {
        public string Execute()
        {
            return "logged off line.";
        }
    }
}