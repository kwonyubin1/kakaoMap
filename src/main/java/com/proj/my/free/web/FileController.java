package com.proj.my.free.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileController {
    // 이미지 파일이 저장될 경로
    private static String CURR_IMATE_PATH = "c:\\tools\\spring_dev\\img";
    
    // 이미지 다운로드를 처리하는 메서드
    @RequestMapping("my/download")
    public void download(@RequestParam("imageFileName") String imageFileName, HttpServletResponse resp) throws IOException {
        OutputStream out = resp.getOutputStream();
        // 다운로드할 이미지 파일의 경로 설정
        String downFile = CURR_IMATE_PATH + "\\" + imageFileName;
        File file = new File(downFile);
        // 해당 경로에 파일이 존재하지 않을 경우
        if (!file.exists()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "file not found");
        }
        // HTTP 헤더 설정
        resp.setHeader("Cache-Control", "no-cache");
        resp.setHeader("Content-Disposition", "attachment; fileName=" + imageFileName);
        try (FileInputStream in = new FileInputStream(file)) {
            byte[] buffer = new byte[1024 * 8];
            while (true) {
                int count = in.read(buffer);
                if (count == -1) {
                    break;
                }
                // 파일을 읽어서 클라이언트에게 전송
                out.write(buffer, 0, count);
            }
        } catch (IOException ex) {
            // 예외 처리
            ex.printStackTrace();
        } finally {
            // 출력 스트림 닫기
            out.close();
        }
    }
    
    // 다중 이미지 업로드를 처리하는 메서드
    @RequestMapping("multiImgUpload")
    public void multiImgUpload(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String sFileInfo = "";
            // 업로드된 파일 이름 가져오기
            String fileName = req.getHeader("file-name");
            // 파일 확장자 추출
            String prefix = fileName.substring(fileName.lastIndexOf(".") + 1);
            prefix = prefix.toLowerCase();
            // 파일 저장 경로 설정
            String path = CURR_IMATE_PATH;
            File file = new File(path);
            // 저장 폴더가 존재하지 않을 경우 생성
            if (!file.exists()) {
                file.mkdir();
            }
            // 저장될 파일 이름 설정
            String realName = UUID.randomUUID().toString() + "." + prefix;
            InputStream is = req.getInputStream();
            OutputStream os = new FileOutputStream(new File(path + "\\" + realName));
            int read = 0;
            byte buffer[] = new byte[1024];
            // 입력 스트림에서 파일을 읽어와서 저장
            while ((read = is.read(buffer)) != -1) {
                os.write(buffer, 0, read);
            }
            if (is != null) {
                is.close();
            }
            os.flush();
            os.close();
            // 업로드된 파일 정보를 클라이언트에게 전달하기 위한 문자열 생성
            sFileInfo += "&bNewList=true";
            sFileInfo += "&sFileName=" + fileName;
            sFileInfo += "&sFileURL=/my/download?imageFileName=" + realName;
            PrintWriter print = resp.getWriter();
            // 클라이언트에게 정보 전달
            print.print(sFileInfo);
            print.flush();
            print.close();
        } catch (IOException e) {
            // 예외 처리
            e.printStackTrace();
        }
    }
}