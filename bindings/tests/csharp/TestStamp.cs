using System;

// Copyright: (C) 2015 iCub Facility
// Author: Paul Fitzpatrick
// CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT
 
// I don't really know C#, just bluffing from Java

namespace HelloNameSpace
{
    public class TestStamp
    {
	static void Main(string[] args)
	{
	    Network.init();
	    BufferedPortBottle p = new BufferedPortBottle();
	    if (!p.open("/csharp")) System.Environment.Exit(1);
	    Stamp ts = new Stamp(); 
	    p.setEnvelope(ts);
	    p.close();
	    Network.fini();
	}
    }
}

