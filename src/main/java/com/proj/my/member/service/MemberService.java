package com.proj.my.member.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.proj.my.member.dao.IMemberDAO;
import com.proj.my.member.vo.MemberVO;

@Service
public class MemberService {
    // Autowired 어노테이션은 자동 의존성 주입을 위해 사용
    // 클래스 필드, 생성자, 메소드에 어노테이션을 표시함으로써 스프링에게
    // 해당 타입을 자동으로 주입하도록 지시
    @Autowired
    IMemberDAO dao; // new를 하지 않아도 사용 가능

    /**
     * 회원 아이디 중복 여부 확인
     * @param memId 회원 아이디
     * @return 중복 여부
     */
    public int idCheck(String memId) throws Exception {
        return dao.idCheck(memId);
    }

    /**
     * 회원가입
     * @param member 회원 정보
     * @throws Exception
     */
    public void registMember(MemberVO member) throws Exception {
        int result = dao.registMember(member);

        if (result == 0) {
            throw new Exception();
        }
    }

    /**
     * 회원조회
     * @param vo 회원 정보
     * @return 조회된 회원 정보
     */
    public MemberVO loginMember(MemberVO vo) {
        return dao.loginMember(vo);
    }

    /**
     * 회원수정
     * @param vo 수정할 회원 정보
     * @throws Exception
     */
    public void updateMember(MemberVO vo) throws Exception {
        int result = dao.updateMember(vo);
        if (result == 0) {
            throw new Exception();
        }
    }

    /**
     * 회원 프로필 이미지 저장 및 DB 경로 저장
     * @param vo 회원 정보
     * @param uploadDir 업로드 디렉토리
     * @param webPath 웹 경로
     * @param file 업로드할 파일
     * @return 업로드된 프로필 이미지의 경로
     * @throws Exception
     */
    public String uploadProfile(MemberVO vo, String uploadDir, String webPath, MultipartFile file) throws Exception {
        String originFileName = file.getOriginalFilename();
        // 서버에 저장되는 파일명(중복을 방지하기 위해 유니크한 이름 생성)
        String storedFileName = UUID.randomUUID().toString() + "_" + originFileName;
        // DB 저장 경로(마이페이지에서 사용 할 경로)
        String dbFilePath = webPath + storedFileName;
        Path filePath = Paths.get(uploadDir, storedFileName);
        try {
            // 물리적으로 저장
            Files.copy(file.getInputStream(), filePath);
        } catch (IOException e) {
            throw new Exception("Failed to save the file", e);
        }
        vo.setProfileImg(dbFilePath);
        int result = dao.profileUpload(vo);
        if (result == 0) {
            throw new Exception();
        }
        return dbFilePath;
    }
}