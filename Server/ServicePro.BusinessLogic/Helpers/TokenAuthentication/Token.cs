
using System;

namespace ServicePro.BusinessLogic.Helpers.TokenAuthentication;
public class Token
{
    public string Value { get; set; }
    public DateTime ExpiryDate { get; set; }
}
