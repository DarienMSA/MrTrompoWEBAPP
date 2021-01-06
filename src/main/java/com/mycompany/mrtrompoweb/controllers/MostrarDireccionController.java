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
import java.nio.charset.StandardCharsets;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/**
 *
 * @author 52811
 */
@WebServlet(name = "MostrarDireccionController", urlPatterns = {"/MostrarDireccionController"})
public class MostrarDireccionController extends HttpServlet {

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
            out.println("<title>Servlet MostrarDireccionController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MostrarDireccionController at " + request.getContextPath() + "</h1>");
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
        JSONObject json = new JSONObject();
        byte[] bytes;
        PrintWriter out = response.getWriter();
        String id = request.getParameter("idAddress");
        address direccion = addressDAO.getAddressByID(Integer.parseInt(id));
        
        bytes = direccion.getColonia().getBytes(StandardCharsets.UTF_8);
        direccion.setColonia(new String(bytes, StandardCharsets.ISO_8859_1));
        
        bytes = direccion.getCalle().getBytes(StandardCharsets.UTF_8);
        direccion.setCalle(new String(bytes, StandardCharsets.ISO_8859_1));
        
        bytes = direccion.getReferencias().getBytes(StandardCharsets.UTF_8);
        direccion.setReferencias(new String(bytes, StandardCharsets.ISO_8859_1));
        
        bytes = direccion.getNum_exterior().getBytes(StandardCharsets.UTF_8);
        direccion.setNum_exterior(new String(bytes, StandardCharsets.ISO_8859_1));
        
        bytes = direccion.getNum_interior().getBytes(StandardCharsets.UTF_8);
        direccion.setNum_interior(new String(bytes, StandardCharsets.ISO_8859_1));
        
        bytes = direccion.getNombreDireccion().getBytes(StandardCharsets.UTF_8);
        direccion.setNombreDireccion(new String(bytes, StandardCharsets.ISO_8859_1));
        
        json.put("CodigoPostal", direccion.getCod_postal());
        json.put("Colonia", direccion.getColonia());
        json.put("Calle", direccion.getCalle());
        json.put("Referencias", direccion.getReferencias());
        json.put("NumExterior", direccion.getNum_exterior());
        json.put("NumInterior", direccion.getNum_interior());
        json.put("Nombre", direccion.getNombreDireccion());
        json.put("Telefono", direccion.getTelefono());
        json.put("Id", direccion.getId_address());
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
