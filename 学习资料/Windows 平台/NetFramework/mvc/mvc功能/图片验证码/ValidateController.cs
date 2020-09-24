using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using 我的网站.Validate;

namespace 我的网站.Controllers.Validate
{
    public class ValidateController : Controller
    {
        // 验证码放在Session["ValidateCode"]
        public ActionResult GetPicValidateCode()
        {
            ValidateCode vCode = new ValidateCode();
            string code = vCode.CreateValidateCode(5);
            Session["ValidateCode"] = code;
            byte[] bytes = vCode.CreateValidateGraphic(code);
            return File(bytes, @"image/jpeg");
        }
    }
}