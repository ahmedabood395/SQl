﻿using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace CrystalReportsApplication5
{
    static class Program
    {
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Form1());
        }
    }
}