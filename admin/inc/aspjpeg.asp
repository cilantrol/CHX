<%
sub aspjpeg(LocalFile,TargetFile,maxw,maxh)
    Dim Jpeg 
    Set Jpeg = Server.CreateObject("Persits.Jpeg") 
    If Err.Number = -2147221005 then 
        Response.write "û�����������밲װ!"'����Ƿ�װAspJpeg��� 
        Response.End() 
    End If
	 
    Jpeg.Open (Server.MapPath(LocalFile))'��ͼƬ 
    If err.number then 
        Response.write"��ͼƬʧ��,����·����" 
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
	
    Dim TempA 'ԭʼͼƬ�Ķ���������
    Dim TempB '���˲�͸������ˮӡ��ͼƬ
    Dim TempC '����Ч��
    TempA = Jpeg.Binary'��ԭʼ���ݸ���TempA 
    '=========������ˮӡ================= 
    Jpeg.Canvas.Font.Color = &Hfffffff'ˮӡ������ɫ 
    Jpeg.Canvas.Font.Family = Arial'���� 
    Jpeg.Canvas.Font.Bold = True'�Ƿ�Ӵ� 
    Jpeg.Canvas.Font.Size = 35'�����С 
    Jpeg.Canvas.Font.ShadowColor = &H000000'��Ӱɫ�� 
    Jpeg.Canvas.Font.ShadowYOffset = 1 
    Jpeg.Canvas.Font.ShadowXOffset = 1 
    Jpeg.Canvas.Brush.Solid = True 
    Jpeg.Canvas.Font.Quality = 100'������� 
    shuiyin = "" 'ˮӡλ�ü����� ,�ձ�ʾ��
    if imgw > 300 and imgh > 80 then  'ͼƬ��ȴ���300,�߶ȴ���80��ˮӡ
        shuiyin = "" 'ˮӡλ�ü����� ,�ձ�ʾ��
    end if
    Jpeg.Canvas.PrintText okw-250,okh-50,shuiyin 'ˮӡλ�ü����� ,�ձ�ʾ��
    TempB = Jpeg.Binary'������ˮӡ������ֵ����TempB����ʱ������ˮӡû�в�͸���� 
   
    '============��������͸����================ 
    Set MyJpeg = Server.CreateObject("Persits.Jpeg") 
    MyJpeg.OpenBinary TempA 
    Set Logo = Server.CreateObject("Persits.Jpeg") 
    Logo.OpenBinary TempB 
    MyJpeg.DrawImage 0,0, Logo, 0.2'0.3��͸���� 
    TempC = MyJpeg.Binary'�����ս����ֵ��TempC,��ʱҲ��������Ŀ��ͼƬ�� 
   
    'response.BinaryWrite TempC'���������������� 
     'response.BinaryWrite TempC'����������������
    'MyJpeg.Interpolation=0 '���ı�ͼƬ����
    MyJpeg.Quality = 100 '���ı�ͼƬ����
    MyJpeg.Save (Server.MapPath(TargetFile)) 
    set TempA = nothing 
    set TempB = nothing 
    set TempC = nothing
    Logo.Close   
    MyJpeg.Close 
    Jpeg.close
end sub
%>