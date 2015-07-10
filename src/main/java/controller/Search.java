package controller;

import model.Output;
import model.Input;
import model.Download;
import global.Data;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nick
 */
public class Search extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if (Input.query == null
                    || !Input.query.equalsIgnoreCase(request.getParameter("query"))) {

                if (Download.rootPath == null) {
                    Data.rootPath = getServletContext().getRealPath("/data/");
                    Download.rootPath = getServletContext().getRealPath("/downloads/");
                }

                Input.init(request);

                Output.init();

                Download.init();

                Download.generateFile();
            }

            setRequest(request);

            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception ex) {
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private void setRequest(HttpServletRequest request) {
        request.setAttribute("geneList", Output.geneList);
        request.setAttribute("invalidGenes", Input.invalidGeneList);
        request.setAttribute("query", Input.query);
        request.setAttribute("url", Download.url);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
