﻿namespace GoFreightShipmentAPI.Controllers.JWT
{
    public class JwtSettings
    {
        public string SecretKey { get; set; }
        public string Issuer { get; set; }
        public string Audience { get; set; }
        public string Subject { get; set; } 
        public int ExpiryMinutes { get; set; }

    }
}
