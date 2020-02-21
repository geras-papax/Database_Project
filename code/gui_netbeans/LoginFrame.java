/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author kouts
 */
   
public class LoginFrame extends javax.swing.JFrame {
// create a function to connect with mysql database
    public static String email;
    
    
    public static Connection getConnection(){
     
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "pass123");
        } catch (Exception ex) {
            System.out.println("here1");
            System.out.println(ex.getMessage());
        }
        
        return con;
    }
       
    /**
     * Creates new form NewJFrame
     */
    public LoginFrame() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        LoginLabel = new javax.swing.JButton();
        userNameTextField = new javax.swing.JTextField();
        userNameLabel = new javax.swing.JLabel();
        passwordLabel = new javax.swing.JLabel();
        welcomeLabel = new javax.swing.JLabel();
        passwordTextField = new javax.swing.JPasswordField();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setPreferredSize(new java.awt.Dimension(1024, 1024));

        LoginLabel.setFont(new java.awt.Font("Tahoma", 2, 24)); // NOI18N
        LoginLabel.setText("Login");
        LoginLabel.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        LoginLabel.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                LoginLabelMouseClicked(evt);
            }
        });
        LoginLabel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                LoginLabelActionPerformed(evt);
            }
        });

        userNameTextField.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                userNameTextFieldActionPerformed(evt);
            }
        });

        userNameLabel.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        userNameLabel.setText("Username");

        passwordLabel.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        passwordLabel.setText("Password");

        welcomeLabel.setFont(new java.awt.Font("Tahoma", 1, 48)); // NOI18N
        welcomeLabel.setForeground(new java.awt.Color(51, 51, 255));
        welcomeLabel.setText("Welcome");

        passwordTextField.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                passwordTextFieldActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(403, 403, 403)
                        .addComponent(welcomeLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 251, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(306, 306, 306)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(userNameLabel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(passwordLabel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addGap(59, 59, 59)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(userNameTextField)
                            .addComponent(passwordTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 197, Short.MAX_VALUE)))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(412, 412, 412)
                        .addComponent(LoginLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 199, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(354, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(86, 86, 86)
                .addComponent(welcomeLabel)
                .addGap(91, 91, 91)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(userNameLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 49, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(userNameTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 49, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(22, 22, 22)
                        .addComponent(passwordLabel, javax.swing.GroupLayout.DEFAULT_SIZE, 45, Short.MAX_VALUE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(18, 18, 18)
                        .addComponent(passwordTextField)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 479, Short.MAX_VALUE)
                .addComponent(LoginLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 78, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(110, 110, 110))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 900, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 88, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 600, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents
    
    private void LoginLabelActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_LoginLabelActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_LoginLabelActionPerformed

    private void userNameTextFieldActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_userNameTextFieldActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_userNameTextFieldActionPerformed

    
    private void LoginLabelMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_LoginLabelMouseClicked
        String username = userNameTextField.getText(); 
        String password = passwordTextField.getText();
        email = username;
        // journalist --> journalist123
        // editor_in_chief --> editor_in_chief123
        // administrative --> administrative123
        // publisher --> publisher123
        PreparedStatement ps1;
        PreparedStatement ps2;
        PreparedStatement ps3;
        PreparedStatement ps4;
        ResultSet rs1;
        ResultSet rs2;
        ResultSet rs3;
        ResultSet rs4;
        String query1 = "SELECT * FROM `JOURNALIST` WHERE `journal_email` =?";
        String query2 = "SELECT chief_editor FROM `JOURNALIST` WHERE `journal_email` =?";
        String query3 = "SELECT * FROM `ADMINISTRATIVE` WHERE `email` =?";
        String query4 = "SELECT owner_name FROM `NEWSPAPER` WHERE `owner_name` =?";
        
        
        
        try {
            ps1 = LoginFrame.getConnection().prepareStatement(query1);
            ps2 = LoginFrame.getConnection().prepareStatement(query2);
            ps3 = LoginFrame.getConnection().prepareStatement(query3);
            ps4 = LoginFrame.getConnection().prepareStatement(query4);
            
            ps1.setString(1, username);
            ps2.setString(1, username);
            ps3.setString(1, username);
            ps4.setString(1, username);
            
            
            rs1 = ps1.executeQuery();
            rs2 = ps2.executeQuery();
            rs3 = ps3.executeQuery();
            rs4 = ps4.executeQuery();
            
            if(rs1.next() && password.equals("journalist123"))
            {
                JOptionPane.showMessageDialog(null, "Login Succesfull");
                dispose(); // close the login frame
                //CreateNewArticle journalist_CreateNewArticle = new CreateNewArticle();
                //journalist_CreateNewArticle.setUser(username);
                
                //new JournalistFrame(username).setVisible(true);
                // connecting to journalistframe
                new JournalistFrame().setVisible(true);
            }
            
            else if(rs2.next() && password.equals("editor_in_chief123"))
            {
                if("yes".equals(rs2.getString("chief_editor")))
                {   
                    JOptionPane.showMessageDialog(null, "Login Succesfull");
                    dispose(); // close the login frame
                     // connecting to EditorInChief frame
                    new EditorInChief().setVisible(true);
                }
                else
                {
                    JOptionPane.showMessageDialog(null, "Login Failed");
                }
                  
            }
            else if(rs3.next() && password.equals("administrative123"))
            {
                   
                    JOptionPane.showMessageDialog(null, "Login Succesfull");
                    dispose(); // close the login frame
                     // connecting to EditorInChief frame
                    new ADMINISTRATIVEFrame().setVisible(true);                                      
                                    
            }
            else if(rs4.next() && password.equals("publisher123"))
            {
                   
                JOptionPane.showMessageDialog(null, "Login Succesfull");
                    dispose(); // close the login frame
                     // connecting to EditorInChief frame
                    new Publisher().setVisible(true);
           
                                                                     
            }
                        
            else if(username.trim().equals("") || password.trim().equals(""))
            {
                JOptionPane.showMessageDialog(null, "One Or More Fields Are Empty");
             
            }
            else
            {
                JOptionPane.showMessageDialog(null, "Login Failed");
            }
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            System.out.println("here2");
        }
        
        // clean the text fields .. has error
        //username.setText(""); 
        //password.setText("");
    }//GEN-LAST:event_LoginLabelMouseClicked
         
        
    private void passwordTextFieldActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_passwordTextFieldActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_passwordTextFieldActionPerformed

    /*
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(LoginFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(LoginFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(LoginFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(LoginFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new LoginFrame().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton LoginLabel;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel passwordLabel;
    private javax.swing.JPasswordField passwordTextField;
    private javax.swing.JLabel userNameLabel;
    private javax.swing.JTextField userNameTextField;
    private javax.swing.JLabel welcomeLabel;
    // End of variables declaration//GEN-END:variables
}
