/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mrtrompoweb.controllers;

import com.mycompany.mrtrompoweb.dao.addressDAO;
import com.mycompany.mrtrompoweb.dao.ordenDAO;
import com.mycompany.mrtrompoweb.dao.pedidoDAO;
import com.mycompany.mrtrompoweb.models.address;
import com.mycompany.mrtrompoweb.models.pedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.List;

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
@WebServlet(name = "PagoController", urlPatterns = {"/PagoController"})
public class PagoController extends HttpServlet {

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
            out.println("<title>Servlet PagoController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PagoController at " + request.getContextPath() + "</h1>");
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
       byte[] bytes;
        String toDo = request.getParameter("Escribir-Guardar");
        String emailActual = (String)session.getAttribute("emailActual");
        if(toDo.equals("Escribir")){
            String NumExterior = "0";
            String Referencias = "Sin referencias.";
        int CodigoPostal = Integer.parseInt(request.getParameter("codigoPostal"));
        String Colonia = request.getParameter("colonia");
        bytes = Colonia.getBytes(StandardCharsets.ISO_8859_1);
        Colonia = new String(bytes, StandardCharsets.UTF_8);
        String Calle = request.getParameter("calle");
        bytes = Calle.getBytes(StandardCharsets.ISO_8859_1);
        Calle = new String(bytes, StandardCharsets.UTF_8);
        if(!request.getParameter("referencias").equals("")){
            Referencias = request.getParameter("referencias");
            bytes = Referencias.getBytes(StandardCharsets.ISO_8859_1);
        Referencias = new String(bytes, StandardCharsets.UTF_8);
        }
        if(!request.getParameter("numExterior").equals("")){
            NumExterior = request.getParameter("numExterior");
            bytes = NumExterior.getBytes(StandardCharsets.ISO_8859_1);
        NumExterior = new String(bytes, StandardCharsets.UTF_8);
        }
        String NumInterior = request.getParameter("numInterior");
        bytes = NumInterior.getBytes(StandardCharsets.ISO_8859_1);
        NumInterior = new String(bytes, StandardCharsets.UTF_8);
        String Telefono = request.getParameter("telefono");
        
        address direccion = new address(0, Colonia, Calle, CodigoPostal, NumExterior, NumInterior, Telefono, Referencias, emailActual, null, null, false);
        addressDAO.resetUserAddressActive(emailActual);
        addressDAO.registerAddress(direccion);
        
        } else if(toDo.equals("Guardado")){
            int idDomicilio = Integer.parseInt(request.getParameter("idDomicilio"));
            addressDAO.resetUserAddressActive(emailActual);
            addressDAO.activeUserAddress(idDomicilio);
        }
        
        int nextOrder = ordenDAO.nextOrder();
        request.setAttribute("nextOrder", nextOrder);
        List<pedido> PedidosUser = pedidoDAO.getPedidosActivosUser(emailActual);
        request.setAttribute("PedidosUser", PedidosUser);
        
        
        request.getRequestDispatcher("pago.jsp").forward(request, response);
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
