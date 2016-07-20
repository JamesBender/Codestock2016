namespace Common
{
    public class CtorAndMethodComponent : ILoggingComponent
    {
        public CtorAndMethodComponent()
        {
            return;
        }

        public string Execute()
        {
            return "blah";
        }
    }
}