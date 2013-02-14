/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dropbox;

import com.dropbox.client2.DropboxAPI;
import com.dropbox.client2.exception.DropboxException;
import com.dropbox.client2.session.*;
import java.sql.*;

/**
 *
 * @author Udit Desai
 */
public class Dropbox {

    final static private String APP_KEY = "iezt39y8f6zvkj8";
    final static private String APP_SECRET = "8aujiqieook9zra";

    final static private Session.AccessType ACCESS_TYPE = Session.AccessType.APP_FOLDER;
    private static DropboxAPI<WebAuthSession> mDBApi;

    private AccessTokenPair tokenPair=null;
    private RequestTokenPair tokens=null;
    private AppKeyPair appKeys=null;
    private WebAuthSession session=null;

    private String ACCESS_TOKEN_KEY=null,ACCESS_TOKEN_SECRET=null;

    public Dropbox() {

        appKeys = new AppKeyPair(APP_KEY,APP_SECRET);
        session = new WebAuthSession(appKeys,ACCESS_TYPE);
        mDBApi = new DropboxAPI<WebAuthSession>(session);
    }

    public WebAuthSession getSession() { return session; }

    public DropboxAPI<WebAuthSession> getMDBApi() { return mDBApi; }

    public String getACCESS_TOKEN_KEY() { return this.ACCESS_TOKEN_KEY; }
    public void setACCESSS_TOKEN_KEY(String key) { this.ACCESS_TOKEN_KEY=key; }

    public String getACCESS_TOKEN_SECERET() { return this.ACCESS_TOKEN_SECRET; }
    public void setACCESSS_TOKEN_SECRET(String secret) { this.ACCESS_TOKEN_SECRET=secret; }

    public String getWebAuthSessionURL() throws DropboxException { return mDBApi.getSession().getAuthInfo().url; }

    public boolean initAccessTokenPair(String username) throws SQLException, ClassNotFoundException {

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webstorm", "root", "");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select tokenKey,tokenSecret from user where username='"+username+"'");

        if(rs.next()) {
            ACCESS_TOKEN_KEY=rs.getString(1);
            ACCESS_TOKEN_SECRET=rs.getString(2);
        }

        if(ACCESS_TOKEN_KEY==null || ACCESS_TOKEN_SECRET==null) {
            return false;
        }
        return true;
    }

    public boolean isAccessTokenPairAvailable() {

        boolean b=true;
        tokenPair = mDBApi.getSession().getAccessTokenPair();
        tokens = new RequestTokenPair(tokenPair.key, tokenPair.secret);
        try { mDBApi.getSession().retrieveWebAccessToken(tokens); }
        catch(DropboxException dbe) { System.out.println(dbe.getStackTrace()); b=false; }
        return b;
    }
}
