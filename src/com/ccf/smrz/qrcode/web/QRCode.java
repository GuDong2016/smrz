package com.ccf.smrz.qrcode.web;

import com.ccf.smrz.userinfo.domain.UserInfo;
import com.ccf.smrz.userinfo.web.LoginController;
import com.ccf.util.MatrixToImageWriter;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

/**
 * Created by dell on 2016/5/4.
 */
@Controller
@RequestMapping(value = "/qrcode")
public class QRCode {
    @RequestMapping(value = "/getQrCode.do")
    public void getQRCode(HttpServletRequest request, HttpServletResponse response) throws IOException, WriterException {
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userinfo");
        String url = "http://123.206.60.110:8080/smrz_webservice/rest/vcode/vcode/";
        url += userInfo.getIdnum();
        HttpClient httpClient = new DefaultHttpClient();
        HttpGet httpGet = new HttpGet(url);
        HttpResponse httpResponse = httpClient.execute(httpGet);

        HttpEntity entity = httpResponse.getEntity();
        String responeStr = null;
        if (entity != null) {
            InputStream instreams = entity.getContent();
            responeStr = LoginController.convertStreamToString(instreams);
            httpGet.abort();
        }

        Gson gson = new Gson();
        Map<String, String> paraMap = gson.fromJson(responeStr, new TypeToken<Map<String, String>>(){}.getType());

        String vcode = "验证码获取失败";
        if (paraMap.get("vcode") != null){
            vcode = paraMap.get("vcode");
        }

        int width = 200;
        int height = 200;
        //二维码的图片格式
        String format = "gif";
        Hashtable hints = new Hashtable();
        //内容所使用编码
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
        BitMatrix bitMatrix = new MultiFormatWriter().encode(vcode,
                BarcodeFormat.QR_CODE, width, height, hints);
        //生成二维码
        File outputFile = new File("d:"+File.separator+"new.gif");
        //MatrixToImageWriter.writeToFile(bitMatrix, format, outputFile);
    }
}
