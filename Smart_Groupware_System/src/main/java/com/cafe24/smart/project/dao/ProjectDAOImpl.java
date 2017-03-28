package com.cafe24.smart.project.dao;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.project.domain.Evaluation;
import com.cafe24.smart.project.domain.Funds;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectEvaluation;
import com.cafe24.smart.project.domain.ProjectMember;

@Repository
public class ProjectDAOImpl implements ProjectDAO {
	private static final Logger log = LoggerFactory.getLogger(ProjectDAOImpl.class);

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 전체프로젝트 목록
	@Override
	public List<Project> selectAllPr() {

		return sqlSession.selectList("PrDAO.selectAll");
	}

	// 인원모집중인 프로젝트목록
	@Override
	public List<Project> selectByProgressPr(String progress) {

		log.debug("ProjectDAOImpl selectByProgressPr progress : " + progress);

		return sqlSession.selectList("PrDAO.selectByProgress", progress);
	}

	// 프로젝트코드로 자금상세내역 조회하기
	@Override
	public List<Funds> selectByPrCodeFu(int prCode) {

		log.debug("ProjectDAOImpl selectByPrCodeFu prCode : " + prCode);

		return sqlSession.selectList("PrDAO.selectByPrCodeFu", prCode);
	}

	// 진행,완료된 프로젝트목록
	@Override
	public List<Project> selectByFinishPr(String progress) {

		log.debug("ProjectDAOImpl selectByFinishPr progress : " + progress);

		return sqlSession.selectList("PrDAO.selectByFinish", progress);
	}

	// 프로젝트 등록
	@Override
	public int insertPr(Project project) {

		log.debug("ProjectDAOImpl insertPr project : " + project);

		return sqlSession.insert("PrDAO.insertPr", project);
	}

	// 세부자금등록
	@Override
	public int insertFu(Funds funds) {

		log.debug("ProjectDAOImpl insertFu funds : " + funds);

		return sqlSession.insert("PrDAO.insertFu", funds);
	}

	// 프로젝트참여인원등록
	@Override
	public int insertPm(ProjectMember projectMember) {

		log.debug("ProjectDAOImpl insertPm projectMember : " + projectMember);

		return sqlSession.insert("PrDAO.insertPm", projectMember);
	}

	// 프로젝트 상세보기 prCode값으로 단일행 조회.
	@Override
	public Project selectByPrCodePr(int prCode) {

		log.debug("ProjectDAOImpl selectByPrCodePr prCode : " + prCode);

		return sqlSession.selectOne("PrDAO.selectByPrCode", prCode);
	}

	// 프로젝트참여인원조회 - 해당 프로젝트별 조회
	@Override
	public List<ProjectMember> selectByPrCodePm(int prCode) {

		log.debug("ProjectDAOImpl selectByPrCodePm prCode : " + prCode);

		return sqlSession.selectList("PrDAO.selectByPrCodePm", prCode);
	}

	// 평가보고서 완료된 프로젝트만 조회
	@Override
	public List<Project> selectByReportPr(String prReport) {

		log.debug("ProjectDAOImpl selectByReportPr prReport : " + prReport);

		return sqlSession.selectList("PrDAO.selectByReportPr", prReport);
	}

	// 플젝 참여인원들 평가보고서 조회
	@Override
	public List<Evaluation> selectByPrCodeEv(int prCode) {

		log.debug("ProjectDAOImpl selectByPrCodeEv prCode : " + prCode);

		return sqlSession.selectList("PrDAO.selectByPrCodeEv", prCode);
	}

	// 프로젝트 검색.
	@Override
	public List<Project> selectByRequirementPr(Project project) {

		log.debug("ProjectDAOImpl selectByRequirementPr project : " + project);

		return sqlSession.selectList("PrDAO.selectByRequirementPr", project);
	}

	// 플젝 평가보고서 조회
	@Override
	public ProjectEvaluation selectByPrCodePrEv(int prCode) {

		log.debug("ProjectDAOImpl selectByPrCodePrEv prCode : " + prCode);

		return sqlSession.selectOne("PrDAO.selectByPrCodePrEv", prCode);
	}

	// 프로젝트 참여 승인된 인원 구하기
	@Override
	public int selectCountPm(int prCode) {

		log.debug("ProjectDAOImpl selectCountPm prCode : " + prCode);

		return sqlSession.selectOne("PrDAO.selectCountPm", prCode);
	}

	// 자금 상세내용 조회
	@Override
	public Funds selectByFuCode(int fuCode) {

		log.debug("ProjectDAOImpl selectByFuCode fuCode : " + fuCode);

		return sqlSession.selectOne("PrDAO.selectByFuCode", fuCode);
	}

	// 팀장정보조회
	@Override
	public Map<String, Object> selectByMmCodeMm(int mmCode) {

		log.debug("ProjectDAOImpl selectByMmCodeMm mmCode : " + mmCode);

		return sqlSession.selectOne("PrDAO.selectByMmCodeMm", mmCode);
	}

	// 등록된 프로젝트 인원 카운트
	@Override
	public int selectAllCountPm(int prCode) {

		log.debug("ProjectDAOImpl selectAllCountPm prCode : " + prCode);

		return sqlSession.selectOne("PrDAO.selectAllCountPm", prCode);
	}

	// 등록된 프로젝트wbs 카운트
	@Override
	public int selectCountWbs(int prCode) {

		log.debug("ProjectDAOImpl selectCountWbs prCode : " + prCode);

		return sqlSession.selectOne("PrDAO.selectCountWbs", prCode);
	}

	// 등록된 자금내역 카운트
	@Override
	public int selectCountFu(int prCode) {

		log.debug("ProjectDAOImpl selectCountFu prCode : " + prCode);

		return sqlSession.selectOne("PrDAO.selectCountFu", prCode);
	}

	// 평가보고서 등록(참여인원평가)
	@Override
	public int insertEv(Evaluation evaluation) {

		log.debug("ProjectDAOImpl insertEv evaluation : " + evaluation);

		return sqlSession.insert("PrDAO.insertEv", evaluation);
	}

	// 평가보고서 등록(프로젝트보고서)
	@Override
	public int insertEvPr(ProjectEvaluation projectEvaluation) {

		log.debug("ProjectDAOImpl insertEvPr projectEvaluation : " + projectEvaluation);

		return sqlSession.insert("PrDAO.insertEvPr", projectEvaluation);
	}

	// 프로젝트 수정처리하기
	@Override
	public int updatePr(Project project) {

		log.debug("ProjectDAOImpl updatePr project : " + project);

		return sqlSession.update("PrDAO.updatePr", project);
	}

	// 참여신청한 인원중 승인된 인원들은 승인으로 수정처리 하기
	@Override
	public int updateApprovalPm(ProjectMember projectMember) {

		log.debug("ProjectDAOImpl updateApprovalPm projectMember : " + projectMember);

		return sqlSession.update("PrDAO.updateByApprovalPm", projectMember);
	}

	// 참여인원수정
	@Override
	public int updateFu(Funds funds) {

		log.debug("ProjectDAOImpl updateFu funds : " + funds);

		return sqlSession.update("PrDAO.updateFu", funds);
	}

	// 프로젝트삭제
	@Override
	public int deletePr(int prCode) {

		log.debug("ProjectDAOImpl deletePr prCode : " + prCode);

		return sqlSession.delete("PrDAO.deletePr", prCode);
	}

	// 참여인원 삭제
	@Override
	public int deletePm(int prCode) {

		log.debug("ProjectDAOImpl deletePm prCode : " + prCode);

		return sqlSession.delete("PrDAO.deletePm", prCode);
	}

	// Wbs 삭제
	@Override
	public int deleteWbs(int prCode) {

		log.debug("ProjectDAOImpl deleteWbs prCode : " + prCode);

		return sqlSession.delete("PrDAO.deleteWbs", prCode);
	}

	// 자금내역 삭제
	@Override
	public int deleteFu(int prCode) {

		log.debug("ProjectDAOImpl deleteFu prCode : " + prCode);

		return sqlSession.delete("PrDAO.deleteFu", prCode);
	}
}