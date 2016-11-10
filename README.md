# ASP.Net File Uploader
File uploader for ASP.NET ( JQuery File uploader with some easy steps )

# Objective & Scope of Common FileUploader.
in ASP.NET FileUploader control works with Asp.net Form element (its legacy of .Net environment), ASP.NET allows only single form on page (which is ' form runat="server" ') so with this legacy we generally use Form element in master page only. If we use ASP.NET FileUploader control or Ajax FileUploader in Master page scenarioes, it usually gives ambiguous behaviour (in some customised cases), plus we cannot make any customization and we should follow the legacy.  

so the Solution on this legacy and to achieve common and customised file uploader functionality I eliminate server side page and built my logic in simple HTML page with the help of JQuery where I am using HTML Form element with HTML iFrame element, where my iFrame interact with your actual parent page and achieve the goal.

# Key Features
- Single file uploade
- Multiple files uploade
- Drag & Drop Single file uploade
- Drag & Drop Multiple files to uploade

# How it works 
  I have put my all logic in one HTML file (including Jquery and CSS) and this page interact with Generic handler and dump your uploaded files on specified path. you just need to call this HTML page in your ASP.NET or HTML with the help of iFrame tag with options as listed below <b>(All these options are in the form of iFrame Attributes)</b>.

#options list of iFrame
Here are all options which you need to use depends on your requirement. 

1. <b>data-StaticPath</b> 
   this will be your static path where your file going to be dump ( code will find the existence of provided directory and dump in it, if directory not found then it will create new directory with same name on provided path and then dump your file in it)

2. <b>data-PathFromAppSettings</b>
   this will be your Key which will be reside in your web.config under AppSetting section where you will mention path where your file going to be dump (code will find the existence of provided directory and dump in it, if directory not found then it will create new directory with same name on provided path and then dump your file in it).
 
3. <b>data-ReturnHTMLAfterUpload</b>
   after your file gets uploaded my code returns some information against uploaded file e.g. (Filename, Extension, Type, Size, path etc.) this information gets wrapped in HTML format which you provide in the option Data-ReturnHTMLAfterUpload, it’s like a template which return from my code with file information.

  e.g. you have file uploader button and bellow the button you have Static HTML table where you will show all uploaded files after your files gets upload successfully, so when any file get upload by my code, below HTML table should update with uploaded file information like name, type, size etc. by adding new HTML row in it so this HTML row will be your template which you needs to mention in this option. 

4. <b>data-AppendReturnedHTMLTo</b> 
   after file get successfully upload on specified path my code wrap file information with template which you have mentioned in Data-ReturnHTMLAfterUpload and returns back but this HTML should appear somewhere on your page, so the Option Data-AppendReturnedHTMLTo point where to append the HTML which has got returned from my File Uploader code 

  e.g. you have file uploader button and bellow the button you have Static HTML table where you will show all uploaded files after your files gets upload successfully, so when any file get upload by my code, below HTML table should update with uploaded file information like name, type, size etc. by adding new HTML row in it so 
Data-AppendReturnedHTMLTo will append HTML which returned to targeted HTML Element. 

5. <b>data-CallbackOnEveryFileUpload</b> 
   after any file upload successfully if you want to fire any JavaScript function then in this case you can use this option where you just need to pass the function name in this option

### My code return's these properties of Uploaded File informations 

* {FileName}
* {FileExtension}
* {FileType}
* {FileSize}
* {FileNameWithoutExtension}
* {FileNameWithPath}

# Example with Explanation 
> please refer Demo.html for better understanding of actual HTML Code.
here i have given just description of each and every HTML tag which you need to add in your page.

### You just need to add below HTML element tags in your page. 
1. <b>IFrame tag</b><br />
    &lt;iFrame<br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Src**="**_RootDirectoryPath/FileUploader/CommonFileUploader.html_**"<br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**data-AppendReturnedHTMLTo**="**_#tblAttachments > tbody_**"<br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**data-ReturnHTMLAfterUpload**="**#_TemplateOfReturnHTMLAfterUpload_**"<br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**data-StaticPath**=""<br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**data-PathFromAppSettings**=""<br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**data-CallbackOnEveryFileUpload**=""><br />
    &lt;/iFrame>


2. <b>HTML Template (Script tag with type “text/html”)</b><br />
    *(here i use simple row template which will replace all "{}" curly bracket properties tags with information of Uploaded File and return plain HTML row to main page from iFrame)*.</b><br /> <br />
    &lt;script **type="text/html"** id="**_TemplateOfReturnHTMLAfterUpload_**"><br />
  	  &nbsp;&nbsp;&nbsp;&nbsp;&lt;tr><br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;td>**{FileName}**&lt;/td><br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;td>**{FileExtension}**&lt;/td><br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;td>**{FileType}**&lt;/td><br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;td>**{FileSize}**&lt;/td><br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;td>**{FileNameWithoutExtension}**&lt;/td><br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;td>**{FileNameWithPath}**&lt;/td><br />
      &nbsp;&nbsp;&nbsp;&nbsp;&lt;/tr><br />
   &lt;/script><br /><br />
   
> **this template can be any customised HTML template depends upon your requirment, only mandatory is you need to add these "{}" curly bracket properties which will replace your uploaded file information after file gets upload**<br />
    
3. <b>Any HTML Element where you want to append returned HTML</b><br />
*(here I used plain HTML Table where the HTML which mentioned inside above Template will append after file gets upload)*<br /><br />
    &lt;table id="**_tblAttachments_**"><br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;thead><br />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;tr><br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;th>**File Name**&lt;/th><br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;th>**Extension**&lt;/th><br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;th>**Type**&lt;/th><br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;th>**Size (KB)**&lt;/th><br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;th>**File Name Without Extension**&lt;/th><br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;th>**File Path**&lt;/th><br />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/tr><br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/thead><br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;**_tbody_**><br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/tbody><br />
    &lt;/table><br />


> `@Note: please notice the relationship of ITALIC BOLD text in above mentioned example for better understanding.`

### Folder path where your files going to be dump.
*(You can use any one option between these 2 options in iFrame attribute , depends on your requirement.)*<br /><br />
**data-StaticPath**=""<br />
**data-PathFromAppSettings**=""<br />

# How to install this File uploader in your application ?

just Download ZIP, you will find FileUploader.rar inside it just unzip it and put FileUploader folder as it is inside your Application root directory. and thats it :) 
happy codding....

## Files hierarchy of FileUploader folder
1. CSS
  - jquery-ui.css
  - jquery.fileupload-ui.css
  - pbar-ani.gif
2. JS
  - jquery-1.11.0.js
  - jquery.fileupload.js
  - jquery.fileupload-ui.js
  - jquery-ui.min.js
3. CommonFileUploader.html
4. FileUploader.ashx
