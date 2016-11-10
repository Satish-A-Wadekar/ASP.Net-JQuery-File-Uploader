<%@ WebHandler Language="C#" Class="IFileUploader" %>

using System;
using System.Web;
using System.Configuration;
using System.Security.AccessControl;

public class IFileUploader : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        try
        {
            if (context.Request.Files.Count == 0)
            {

                context.Response.ContentType = "text/plain";
                context.Response.Write("No files received.");

            }
            else
            {
                HttpPostedFile uploadedfile = context.Request.Files[0];
                string PathFromAppSettings = Convert.ToString(context.Request.QueryString["pathfromappsettings"]),
                        StaticPath = Convert.ToString(context.Request.QueryString["staticpath"]),
                        ClientId = Convert.ToString(context.Request.QueryString["ClientId"]),
                        FileNameWithoutExtension = string.Empty,
                        FileExtension = string.Empty,
                        FileName = uploadedfile.FileName,
                        FileNameWithPath = string.Empty,
                        FileType = uploadedfile.ContentType,
                        FilePath = string.Empty;

                int FileSize = uploadedfile.ContentLength;

                if (PathFromAppSettings != null)
                {
                    var AppSettingPath = ConfigurationManager.AppSettings[PathFromAppSettings].ToString();

                    if (!System.IO.Directory.Exists(HttpContext.Current.Server.MapPath(AppSettingPath + "\\" + ClientId)))
                    {
                        System.IO.Directory.CreateDirectory(HttpContext.Current.Server.MapPath(AppSettingPath + "\\" + ClientId));
                    }
                    FilePath = HttpContext.Current.Server.MapPath(AppSettingPath + "\\" + ClientId) + "\\" + FileName;
                }
                else if (StaticPath != null)
                {
                    if (!System.IO.Directory.Exists(HttpContext.Current.Server.MapPath(StaticPath + "\\" + ClientId)))
                    {
                       System.IO.Directory.CreateDirectory(HttpContext.Current.Server.MapPath(StaticPath + "\\" + ClientId));
                    }
                    FilePath = HttpContext.Current.Server.MapPath(StaticPath + "\\" + ClientId) + "\\" + FileName;
                }
                try
                {
                    uploadedfile.SaveAs(FilePath);
                    //get file extension
                    FileExtension = System.IO.Path.GetExtension(FilePath);
                    //Convert path
                    FileNameWithPath = HttpUtility.UrlEncode(FilePath);
                }
                catch (Exception e) { }
                //get file name without extension
                FileNameWithoutExtension = FileName.Substring(1, (FileName.LastIndexOf(".")));

                context.Response.ContentType = "text/plain";
                context.Response.Write("{ " +
                                            " \"FileName\":\"" + FileName + "\"," +
                                            " \"FileExtension\": \"" + FileExtension + "\"," +
                                            " \"FileType\":\"" + HttpUtility.UrlEncode(FileType) + "\"," +
                                            " \"FileSize\":\"" + FileSize + "\", " +
                                            " \"FileNameWithoutExtension\": \"" + FileNameWithoutExtension + "\", " +
                                            " \"FileNameWithPath\": \"" + FileNameWithPath + "\" " +
                                        "}");
            }
        }
        catch (Exception exe) { }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}