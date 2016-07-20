namespace Common
{
    public class Logger : ILoggingComponent
    {
        private ILoggingSink _loggingSink;

        public Logger (ILoggingSink loggingSink)
        {
            _loggingSink = loggingSink;
        }
        public string Execute()
        {
            return string.Format("logged on {0} successfully", _loggingSink.LoggingResult());
        }
    }
}