using DbMon.NET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Speech.Synthesis;
using System.Text;
using System.Threading.Tasks;

namespace DEBUSG
{
    class Program
    {
        static void Main(string[] args)
        {
            DebugMonitor.Start();
            DebugMonitor.OnOutputDebugString += new
                  OnOutputDebugStringHandler(OnOutputDebugString);
            Console.WriteLine("Press 'Enter' to exit.");
            Console.ReadLine();
            DebugMonitor.Stop();
        }
        private static void OnOutputDebugString(int pid, string text)
        {

            if (text.Contains("LOGITECHSCRIPT_"))
            {
                SpeechSynthesizer synth = new SpeechSynthesizer();

                // Configure the audio output.   
                synth.SetOutputToDefaultAudioDevice();

                // Speak a string.  
                synth.Speak(text.Replace("LOGITECHSCRIPT_",""));

                 Console.WriteLine(DateTime.Now + ": [" + pid + "] " + text);

            }
        }
    }
}
