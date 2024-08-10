﻿using GoFreightHelpers;
using GoFreightRepository.Models;
using GoFreightShipmentAPI.Controllers.JWT;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Services.DTO.Request;
using Services.Wrapper;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace GoFreightShipmentAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserAuthController : ControllerBase
    {
        private  IJwtSettings _jwtSettings;
        IBaseService _baseService;

        public UserAuthController(IBaseService baseService, IJwtSettings settings)
        {
            _baseService = baseService;
            _jwtSettings= settings;
        }

        [HttpPost("token")]
        public IActionResult Login(UserDataRequestModel model)
        {
            //var data = _jwtSettings.Audience;
            var userAuth = _baseService.AuthService.Login(model, _jwtSettings);
            return Ok(userAuth);
           
        }

        //public string GenerateToken(UserProfile model)
        //{
        //    var claims = new[]
        //   {
        //         new Claim(JwtRegisteredClaimNames.Sub,model.Email),
        //         new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
        //         new Claim("UserId", model.Email.ToString()),
        //         new Claim("DisplayName", model.FullName.ToString())
        //     };
        //    var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_jwtSettings.SecretKey));
        //    var cred = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

        //    var token = new JwtSecurityToken(
        //        issuer: _jwtSettings.Issuer,
        //        audience: _jwtSettings.Audience,
        //        claims: claims,
        //        expires: DateTime.Now.AddMinutes(Convert.ToInt32(_jwtSettings.ExpiryMinutes)),
        //        signingCredentials: cred
        //        );
        //    return new JwtSecurityTokenHandler().WriteToken(token);
        //}
    }
}
