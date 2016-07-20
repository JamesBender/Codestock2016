using System;
using Ninject;

namespace Common
{
    public class NamedLoggerEngine : IBusinessEngine
    {
        private readonly ILoggingComponent _simpleLogger;
        private readonly ILoggingComponent _distLogger;

        public NamedLoggerEngine(
            [Named("Simple")] ILoggingComponent simpleLogger, 
            [Named("DistLogger")] ILoggingComponent distLogger)
        {
            _simpleLogger = simpleLogger;
            _distLogger = distLogger;
        }

        public string RunProcess()
        {
            Console.WriteLine("Simple logger says {0}", _simpleLogger.Execute());
            Console.WriteLine("Dist logger says {0}", _distLogger.Execute());
            return "done";
        }
    }
}