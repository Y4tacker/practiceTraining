package com.renhouse.lisentner;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.*;

public class OnlineNumberListener implements ServletContextListener,
        HttpSessionListener, HttpSessionAttributeListener {
    private static int activeSessions = -1;

    // Public constructor is required by servlet spec
    public OnlineNumberListener() {
    }

    // -------------------------------------------------------
    // ServletContextListener implementation
    // -------------------------------------------------------
    public void contextInitialized(ServletContextEvent sce) {
      /* This method is called when the servlet context is
         initialized(when the Web application is deployed).
         You can initialize servlet context related data here.
      */
    }

    public void contextDestroyed(ServletContextEvent sce) {
      /* This method is invoked when the Servlet Context
         (the Web application) is undeployed or
         Application Server shuts down.
      */
    }

    // -------------------------------------------------------
    // HttpSessionListener implementation
    // -------------------------------------------------------
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
        activeSessions += 1;
        HttpSession session = se.getSession();
        session.setAttribute("online",activeSessions);
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
        if (activeSessions > 0){
            activeSessions -= 1;
        }
        HttpSession session = se.getSession();
        session.setAttribute("online",activeSessions);

    }

    // -------------------------------------------------------
    // HttpSessionAttributeListener implementation
    // -------------------------------------------------------

    public void attributeAdded(HttpSessionBindingEvent sbe) {
      /* This method is called when an attribute 
         is added to a session.
      */
    }

    public void attributeRemoved(HttpSessionBindingEvent sbe) {
      /* This method is called when an attribute
         is removed from a session.
      */
    }

    public void attributeReplaced(HttpSessionBindingEvent sbe) {
      /* This method is invoked when an attribute
         is replaced in a session.
      */
    }

    public static int getActiveSessions() {
        return activeSessions;
    }
}
