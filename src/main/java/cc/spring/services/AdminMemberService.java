package cc.spring.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.spring.dto.BanMemberDTO;
import cc.spring.dto.BoardCountDTO;
import cc.spring.dto.MemberDTO;
import cc.spring.dto.ShopListDTO;
import cc.spring.repositories.AdminDAO;
import cc.spring.repositories.BusinessMemberDAO;
import cc.spring.repositories.ClientMemberDAO;

@Service
public class AdminMemberService {
	@Autowired
	private AdminDAO adminDAO;
	
	@Autowired
	private BusinessMemberDAO bDAO;
	
	@Autowired
	private ClientMemberDAO cDAO;
	
	public boolean login(String id, String pw) {
		return adminDAO.login(id, pw);
	}
	
	public MemberDTO selectAdminMemberInfo(String id, String pw) {
		return adminDAO.selectAdminMemberInfo(id, pw);
	}
	
	public List<MemberDTO> selectAllBusinessMember() {
		return bDAO.selectAllBusinessMember();
	}
	
	public List<MemberDTO> selectAllClientMember() {
		return cDAO.selectAllClientMember();
	}
	
	public Map<String, Integer> selectMealCount() {
		Map<String, Integer> mealCountMap = new HashMap<String, Integer>();
		mealCountMap.put("mealSuccessTotal", adminDAO.selectSuccessMeal());
		mealCountMap.put("mealFailTotal", adminDAO.selectFailMeal());
		return mealCountMap;
	}	
	
	public Map<String, Integer> selectBasketCount(){
		Map<String, Integer> basketCountMap = new HashMap<>();
		basketCountMap.put("basketSuccess", adminDAO.selectSuccessBasket());
		basketCountMap.put("basketFail", adminDAO.selectFailBasket());
		return basketCountMap;
	}
	
	public Map<String, Integer> selectTotalCount(){
		Map<String, Integer> totalCountMap = new HashMap<>();
		totalCountMap.put("totalSuccess", adminDAO.selectTotalSuccess());
		totalCountMap.put("totalFail", adminDAO.selectTotalFail());
		return totalCountMap;
	}
	
	public List<MemberDTO> ClinetUserList() {
		return adminDAO.clientUserList();
	}

	public List<MemberDTO> BusinessUserList() {
		return adminDAO.businessUserList();
	}
	
	public Map<String, Integer> recentVisitCount() {
		Map<String, Integer> recentVisitMap = new HashMap<>();
		recentVisitMap.put("recentVisitClient", adminDAO.recentVisitClient());
		recentVisitMap.put("recentVisitBusiness", adminDAO.recentVisitBusiness());
		return recentVisitMap;
    }
	
	public List<ShopListDTO> selectShopList() {
		return adminDAO.selectShopList();
	}
	
	@Transactional
	public int BanMember(int memberCode, BanMemberDTO dto) {
		adminDAO.deleteBanMember(memberCode);
		return adminDAO.insertBanMember(dto);
	}
	
	public Map<String, List<BoardCountDTO>> recentBoardCount(){
		Map<String, List<BoardCountDTO>> recentBoardMap = new HashMap<>();
		recentBoardMap.put("Announcement", adminDAO.boardAnnouncementCount());
		recentBoardMap.put("Free", adminDAO.boardFreeCount());
		recentBoardMap.put("Review", adminDAO.boardReviewCount());
		return recentBoardMap;
	}
}
