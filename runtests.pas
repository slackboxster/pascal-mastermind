program runtests;

{$mode objfpc}{$H+}

uses
  Classes, consoletestrunner, testcase1;
  //add here the units containing your testcases;
  
var
  App: TTestRunner;

begin
  App := TTestRunner.Create(nil);
  App.Initialize;
  App.Title := 'FPCUnit Console runner.';
  App.Run;
  App.Free;
end.


///how the heck I figured out this little piece of code:


//google search for "fpcunit without lazarus" found me this link: https://fpc-pascal.freepascal.narkive.com/amwEbXWx/fpcunit-without-lazarus
//which had an answer of the following:
    //FPCUnit is part of FCL and it doesn't require LCL. Of course if you install
    //via packages under Lazarus components folder, it would depend on Lazarus
    //parts (e.g, LCL), esp. for the runner. Open
    //fpc/packages/fcl-fpcunit/src/demo for a pure FPC example. Or
    //http://free-pascal-general.1045716.n5.nabble.com/file/n5128730/fpcunit.pdf
    //here for the documentation
//so I went to the free pascal site and poked around until I found the link to the source code repos - on gitlab!
    // google "free pascal"
    // (click a bunch of random links)
    // under coding, click "development"
    // scroll down to "Connect to Source Repository with Git" section
    //boom - gitlab link.
//https://gitlab.com/freepascal.org/fpc
    //go into the source repo, into packages, and cmd-f for "unit"
    //ok, this looks interesting. 
    //click into source, and the above code was in the readme!
//finally found the readme here: https://gitlab.com/freepascal.org/fpc/source/-/tree/main/packages/fcl-fpcunit/src