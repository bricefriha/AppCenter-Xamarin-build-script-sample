using System;
using System.Collections.Generic;
using System.Text;

namespace YourApp
{
    public static class AppConstant
    {
        public static string Secret = Environment.GetEnvironmentVariable("Secret");
        
    }
}
