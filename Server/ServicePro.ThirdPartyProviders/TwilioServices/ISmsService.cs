using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServicePro.ThirdPartyProviders.TwilioServices
{
    public interface ISmsService
    {
        Task<string> Send(string recipient, string message);
    }
}
