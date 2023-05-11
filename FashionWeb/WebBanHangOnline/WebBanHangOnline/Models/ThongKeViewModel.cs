using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanHangOnline.Models
{
    public class ThongKeViewModel
    {
        public int HomNay { get; set; }
        public int HomQua { get; set; }
        public int TuanNay { get; set; }
        public int TuanTruoc { get; set; }
        public int ThangNay { get; set; }
        public int ThangTruoc { get; set; }
        public int TatCa { get; set; }
    }
    public class ThongKeModel
    {
        public string HomNay { get; set; }
        public string HomQua { get; set; }
        public string TuanNay { get; set; }
        public string TuanTruoc { get; set; }
        public string ThangNay { get; set; }
        public string ThangTruoc { get; set; }
        public string TatCa { get; set; }
    }
}