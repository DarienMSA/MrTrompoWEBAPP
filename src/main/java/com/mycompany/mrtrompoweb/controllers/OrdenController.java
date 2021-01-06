/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mrtrompoweb.controllers;

import com.mycompany.mrtrompoweb.dao.addressDAO;
import com.mycompany.mrtrompoweb.dao.ordenDAO;
import com.mycompany.mrtrompoweb.dao.pedidoDAO;
import com.mycompany.mrtrompoweb.dao.productsDAO;
import com.mycompany.mrtrompoweb.dao.userDAO;
import com.mycompany.mrtrompoweb.models.address;
import com.mycompany.mrtrompoweb.models.orden;
import com.mycompany.mrtrompoweb.models.pedido;
import com.mycompany.mrtrompoweb.models.products;
import com.mycompany.mrtrompoweb.models.user;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 52811
 */
@WebServlet(name = "OrdenController", urlPatterns = {"/OrdenController"})
public class OrdenController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrdenController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrdenController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String metodoPago = request.getParameter("metodoPago");
        List<products> Productos = productsDAO.getAllProducts();
        boolean Tarjeta = false;
        int precioTotal = 15;
        if(metodoPago.equals("Tarjeta"))
            Tarjeta = true;
         String emailActual = (String)session.getAttribute("emailActual");
         List<pedido> PedidoActual = pedidoDAO.getPedidosActivosUser(emailActual);
         for(pedido p : PedidoActual){
             precioTotal += p.getPrecio_total();
         }
         List<address> direccionesUser = addressDAO.getAddressUser(emailActual);
         address direccionActual = null;
         for(address a : direccionesUser){
             if(a.isActivo())
                 direccionActual = a;
         }
         user User = new user(emailActual);
         User = userDAO.searchEmail(User);
         orden nuevoOrden = new orden(0, precioTotal, emailActual, Tarjeta, null, direccionActual.getId_address());
         
        String pedidos = "";
        
        for(pedido p : PedidoActual){
            pedidos += "<h3 class=\"bold\">" + p.getNombre_prod() + " x" + Integer.toString(p.getCantidad()) + "</h3> <p class=\"pb-5 center\">" + p.getComentario() + "</p>";
        }
         
         for(products Producto : Productos){
             for(pedido p : PedidoActual){
                 if(p.getNombre_prod().equals(Producto.getNombre())){
                     productsDAO.updateProductsSold(p.getNombre_prod(), p.getCantidad(), p.getPrecio_total());
                     break;
                 }
             }
         }
         
         ordenDAO.insertOrder(nuevoOrden);
         String ped = Integer.toString(pedidoDAO.howManyActivePedidos((String)session.getAttribute("emailActual")));
        session.setAttribute("tienePedidos", ped);
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////EMAIL
        String from = "mrtrompo.lmad@gmail.com";
        String to = emailActual;
        String subject = "Tu orden de Mr. Trompo";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", "587");
        Session sessionEmail = Session.getDefaultInstance(props);

        try {
            InternetAddress fromAddress = new InternetAddress(from);
            InternetAddress toAddress = new InternetAddress(to);

            Message message = new MimeMessage(sessionEmail);
            message.setFrom(fromAddress);
            message.setRecipient(Message.RecipientType.TO, toAddress);
            message.setSubject(subject);

           String ms = "<head>" +
    "<style type=\"text/css\">" +
        ".center {"+
            "text-align: center;" +
        "}" +
        ".left {" +
            "text-align: left;" +
        "}" +
        ".text-white {" +
            "color: white;" +
        "}" +
        ".pt-5{" +
            "padding-top:25px;" +
        "}" +
         ".pb-5 {" +
            "padding-bottom: 25px;" +
        "}" +
        ".banner {" +
            "padding-top: 5px;" +
            "padding-bottom: 5px;" +
            "background: linear-gradient(90deg," +
                    "rgba(166, 0, 0, 1) 0%," +
                    "rgba(185, 35, 35, 1) 0%," +
                    "rgba(164, 16, 16, 1) 47%," +
                    "rgba(119, 0, 0, 1) 100%);" +
        "}" +
        "ul {" +
            "width: 5%;" +
            "margin: auto;" +
        "}" +
        ".footer {" +
            "margin-top: 20px;" +
            "height: 80px;" +
        "}" +
        ".header {" +
            "width: 100%;" +
            "height: 200px;" +
            "background-image: url(https://info7rm.blob.core.windows.net.optimalcdn.com/images/2017/11/15/tacos.jpg);"+
            "position: relative;"+
            "background-repeat: no-repeat;"+
            "background-position: center;"+
            "background-size: cover;"+
        "}" +
        ".header:before {" +
            "content: \"\";" +
            "width: 100%;" +
            "height: 100%;" +
            "position: absolute;" +
            "top: 0;" +
            "left: 0;"  +
            "background: rgba(0, 0, 0, 0.5);" +
            "background-image: linear-gradient(rgba(255, 255, 255, 0) 60%," +
                    "rgba(255, 255, 255, 1) 100%);"+
        "}"+
                   ".bold{" +
            "font-weight: bold;" +
        "}" +
    "</style>"+
"</head>" +
                    "<div class=\"center banner\">" +
        "<h1 class=\"text-white\">MR. TROMPO</h1>" +
    "</div>" +
    "<div class=\"header\">" +
    "</div>" +
    "<div class=\"center\">" +
        "<h3>Muchas gracias por tu compra "+ User.getName() + ", esperemos que disfrutes lo que ordenaste y vuelvas a comprarnos " +
            "algo.</h3>" +
    "</div>" +
    "<div class=\"center\">" +
        "<h3>Aquí están los datos de tu orden:</h3>" +
    "</div>" +
    "<div class=\"center\">" +
        "<h3>Orden</h3>" +
                  pedidos +
    "</div>" +
    "<div class=\"center pt-5\">" +
        "<span>Precio Total: $" + Integer.toString(precioTotal) + "</span>" +
    "</div>" +
    "<footer class=\"banner footer\">" +
    "</footer>";
            
            message.setContent(ms, "text/html; charset=utf-8");
            message.saveChanges();

            // Send the message to the recipient. You also need to specify the username 
            // and password to authenticate to the mail server.
            Transport.send(message, "mrtrompo.lmad", "lmadarsaga");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
         request.getRequestDispatcher("comprado.jsp").forward(request, response);
         
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
