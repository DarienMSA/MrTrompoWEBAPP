/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mrtrompoweb.controllers;

import com.mycompany.mrtrompoweb.dao.addressDAO;
import com.mycompany.mrtrompoweb.models.address;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;

/**
 *
 * @author 52811
 */
@WebServlet(name = "CrearDomicilioPerfil", urlPatterns = {"/CrearDomicilioPerfil"})
public class CrearDomicilioPerfil extends HttpServlet {

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
            out.println("<title>Servlet CrearDomicilioPerfil</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrearDomicilioPerfil at " + request.getContextPath() + "</h1>");
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
        String colonia = request.getParameter("Colonia");
        String calle = request.getParameter("Calle");
        String referencias = "Sin Referencias.";
        String num_exterior = "";
        int cod_postal = Integer.parseInt(request.getParameter("CodigoPostal"));
        if(!request.getParameter("NumExterior").equals("")){
            num_exterior = request.getParameter("NumExterior");
        }
        String num_interior = request.getParameter("NumInterior");
        String telefono = request.getParameter("Telefono");
        if(!request.getParameter("Referencias").equals("")){
            referencias = request.getParameter("Referencias");
        }
        String nombreDireccion = request.getParameter("Nombre");
        
        String emailActual = (String)session.getAttribute("emailActual");
        
        address direccionCreada = new address(0, colonia, calle, cod_postal, num_exterior, num_interior, telefono, referencias, emailActual, null, nombreDireccion, false);
        addressDAO.insertAddressAccount(direccionCreada);
        
        PrintWriter out = response.getWriter();
        JSONObject json = new JSONObject();
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        Date date = new Date();
        
        json.put("nuevoId", addressDAO.lastIdAddress() - 1);
        json.put("fechaHoy", dateFormat.format(date));
        out.print(json);
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
