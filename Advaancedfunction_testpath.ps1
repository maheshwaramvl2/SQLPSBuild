#Import-Module  -Name SQLPS

#Get-Module -Name SQLPS -ListAvailable


<#1. Write a powershell funtion for the below requirement. Give the function name as : Validate-Path


Take the path as an input parameter from the user and validate the given path is right or not. In both success case or any failure case the output format should like below.

Success = $false
Message = Given path is <$path> invalid #>


 function Validate-Path{
            [cmdletbinding()]
            #[parameter(mandatory=$true)]#[parameter(Mandatory= $true, HelpMessage="Enter a string")]
  param(
         [string] $path
         
  )
 
  try{
       $output =[pscustomobject]@{   #$finalOuput = [pscustomobject]@{
       success = "$false"
       Data ="$null"
  }
     if(test-path -path $path){
      
     $output.data ="the given $path is valid"
     $output.success = $true
     
    }

    else{
        
       $output.data ="the given $path is not valied"

           
    }
        
       
     }
  catch{
           $output.data ="$($_.exception.message)"
  }
 finally{

 $output
 }
 }


 validate-path -path C:\ttt


