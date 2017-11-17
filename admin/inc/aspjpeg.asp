<%
sub aspjpeg(LocalFile,TargetFile,maxw,maxh)
    Dim Jpeg 
    Set Jpeg = Server.CreateObject("Persits.Jpeg") 
    If Err.Number = -2147221005 then 
        Response.write "没有这个组件，请安装!"'检查是否安装AspJpeg组件 
        Response.End() 
    End If
	 
    Jpeg.Open (Server.MapPath(LocalFile))'打开图片 
    If err.number then 
        Response.write"打开图片失败,请检查路径！" 
        Response.End() 
    End if 
	
    dim imgw,imgh,bili
    imgw = Jpeg.OriginalWidth
    imgh = Jpeg.OriginalHeight
   
    if (imgw > maxw or imgh > maxh) then
        hightt = (imgh * maxw) /imgw
	    if(imgw / maxw - imgh / maxh >=0) then
            okw = maxw
            okh =(imgh * maxw) / imgw
	    else
	        okw = (imgw * maxh) / imgh
            okh = maxh
        end if
    else
        okw = imgw
        okh = imgh
    end if
    Jpeg.Width = okw
    Jpeg.Height = okh
	
    Dim TempA '原始图片的二进制数据
    Dim TempB '加了不透明文字水印的图片
    Dim TempC '最终效果
    TempA = Jpeg.Binary'将原始数据赋给TempA 
    '=========加文字水印================= 
    Jpeg.Canvas.Font.Color = &Hfffffff'水印文字颜色 
    Jpeg.Canvas.Font.Family = Arial'字体 
    Jpeg.Canvas.Font.Bold = True'是否加粗 
    Jpeg.Canvas.Font.Size = 35'字体大小 
    Jpeg.Canvas.Font.ShadowColor = &H000000'阴影色彩 
    Jpeg.Canvas.Font.ShadowYOffset = 1 
    Jpeg.Canvas.Font.ShadowXOffset = 1 
    Jpeg.Canvas.Brush.Solid = True 
    Jpeg.Canvas.Font.Quality = 100'输出质量 
    shuiyin = "" '水印位置及文字 ,空表示无
    if imgw > 300 and imgh > 80 then  '图片宽度大于300,高度大于80加水印
        shuiyin = "" '水印位置及文字 ,空表示无
    end if
    Jpeg.Canvas.PrintText okw-250,okh-50,shuiyin '水印位置及文字 ,空表示无
    TempB = Jpeg.Binary'将文字水印处理后的值赋给TempB，这时，文字水印没有不透明度 
   
    '============调整文字透明度================ 
    Set MyJpeg = Server.CreateObject("Persits.Jpeg") 
    MyJpeg.OpenBinary TempA 
    Set Logo = Server.CreateObject("Persits.Jpeg") 
    Logo.OpenBinary TempB 
    MyJpeg.DrawImage 0,0, Logo, 0.2'0.3是透明度 
    TempC = MyJpeg.Binary'将最终结果赋值给TempC,这时也可以生成目标图片了 
   
    'response.BinaryWrite TempC'将二进输出给浏览器 
     'response.BinaryWrite TempC'将二进输出给浏览器
    'MyJpeg.Interpolation=0 '不改变图片质量
    MyJpeg.Quality = 100 '不改变图片质量
    MyJpeg.Save (Server.MapPath(TargetFile)) 
    set TempA = nothing 
    set TempB = nothing 
    set TempC = nothing
    Logo.Close   
    MyJpeg.Close 
    Jpeg.close
end sub
%>