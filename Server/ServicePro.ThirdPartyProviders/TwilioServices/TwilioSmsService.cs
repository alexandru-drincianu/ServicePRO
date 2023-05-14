using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

namespace ServicePro.ThirdPartyProviders.TwilioServices
{
    public class TwilioSmsService : ISmsService
    {
        private readonly string _accountSid;
        private readonly string _authToken;
        private readonly string _fromNumber;

        public TwilioSmsService(IOptions<TwilioSmsServiceSettings> twilioSettings)
        {
            _accountSid = twilioSettings.Value.AccountSid ?? throw new ArgumentNullException(nameof(twilioSettings));
            _authToken = twilioSettings.Value.AuthToken ?? throw new ArgumentNullException(nameof(twilioSettings));
            _fromNumber = twilioSettings.Value.FromNumber ?? throw new ArgumentNullException(nameof(twilioSettings));
        }

        public async Task<string> Send(string recipient, string message)
        {
            TwilioClient.Init(_accountSid, _authToken);

            var response = MessageResource.Create(
                body: message,
                from: new Twilio.Types.PhoneNumber(_fromNumber),
                to: new Twilio.Types.PhoneNumber(recipient)
            );

            return response.ErrorMessage;
        }
    }
}
