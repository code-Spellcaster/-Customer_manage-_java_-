package customer;

import static constants.MessageConstants.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import util.LogUtil;
import util.StringUtil;

/**
 * 顧客情報のロジック
 */
public class CustomerLogic {

    /**
     * DAO経由で顧客情報をDBから取得する
     * @param id 取得する顧客情報のID
     * @return 顧客情報Bean
     */
    public CustomerBean load(int id) {
        LogUtil.println(this.getClass().getSimpleName() + "#load");

        CustomerDao customerDao = new CustomerDao();
        CustomerBean customer = customerDao.load(id);

        return customer;
    }

    /**
     * DAO経由で顧客情報をDBに追加する
     * @param customer 顧客情報Bean
     * @return エラーメッセージ(処理成功時、null)
     */
    public String add(CustomerBean customer) {
        LogUtil.println(this.getClass().getSimpleName() + "#add");

        String errMessage = null;
        CustomerDao customerDao = new CustomerDao();
        if (customerDao.add(customer) != null) {
            errMessage = MESSAGE_CAN_NOT_ADD;
        }
        
        return errMessage;
    }

    /**
     * DAO経由でDBの顧客情報を更新する
     * @param customer 顧客情報Bean
     * @return エラーメッセージ(処理成功時、null)
     */

    public String update(CustomerBean customer) {
        LogUtil.println(this.getClass().getSimpleName() + "#update");

        if (customer == null) {
            return MESSAGE_NO_EXIST_DATA_TO_UPDATE;
        }

        String errMessage = null;
        CustomerDao customerDao = new CustomerDao();
        errMessage = customerDao.update(customer);
        if (errMessage != null) {
            errMessage = MESSAGE_CAN_NOT_UPDATE;
        }
        return errMessage;
    }


    /**
     * DAO経由でDBの顧客情報を削除する
     * @param customer 顧客情報Bean
     * @return エラーメッセージ(処理成功時、null)
     */
    public String delete(CustomerBean customer) {
        LogUtil.println(this.getClass().getSimpleName() + "#delete");

       if (customer == null) {
            return MESSAGE_NO_EXIST_DATA_TO_DELETE;
        }

        String errMessage = null;
        int id = customer.getId();
        CustomerDao customerDao = new CustomerDao();
        errMessage = customerDao.delete(id);
        if (errMessage != null) {
            errMessage = MESSAGE_CAN_NOT_DELETE;
        }

        return errMessage;
    }

    /**
     * リクエスト内の顧客情報をセッションに顧客情報Beanとして設定する
     * @param request 顧客情報を含むリクエスト
     */
    public void setCustomerBeanFromRequestToSession(HttpServletRequest request) {
        LogUtil.println(this.getClass().getSimpleName() + "#setCustomerBeanFromRequestToSession");

        CustomerBean customer = new CustomerBean();
        
        if (request.getParameter("id") != null) {
            customer.setId(Integer.parseInt(request.getParameter("id")));
        }
        customer.setName(StringUtil.exchangeESCEncoding(request.getParameter("name")));
        customer.setZip(StringUtil.exchangeESCEncoding(request.getParameter("zip")));
        customer.setAddress1(StringUtil.exchangeESCEncoding(request.getParameter("address1")));
        customer.setAddress2(StringUtil.exchangeESCEncoding(request.getParameter("address2")));
        customer.setTel(StringUtil.exchangeESCEncoding(request.getParameter("tel")));
        customer.setFax(StringUtil.exchangeESCEncoding(request.getParameter("fax")));
        customer.setEmail(StringUtil.exchangeESCEncoding(request.getParameter("email")));

        HttpSession session = request.getSession();
        session.setAttribute("customer", customer);

    }
}