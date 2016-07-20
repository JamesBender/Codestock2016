using System;
using Ninject;

namespace Common
{
    public class LegacyEngine
    {        
        [Inject]
        [PropertyLogger]
        public ILoggingComponent Logger { get; set; }

        public string RunProcess()
        {
            var returnValue = $"Transaction run | {Logger.Execute()} | logged in second logger.";
            Console.WriteLine(returnValue);
            return returnValue;
        }
    }
}