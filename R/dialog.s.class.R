################################
# GUI for s.class function
################################
"dialog.s.class" <- function(show, history)
{
  #
  # Main dialog window with title
  #
  tt <- tktoplevel()
  tkwm.title(tt,"s.class")
  
  frame1 <- tkframe(tt, relief="groove", borderwidth=2)
  frame3 <- tkframe(tt, relief="groove", borderwidth=2)
  frame4 <- tkframe(tt, relief="groove", borderwidth=2)
  frame2 <- tkframe(tt, relief="groove", borderwidth=2)
  xyframe <- tkframe(frame1, relief="groove", borderwidth=2)
  labframe <- tkframe(frame1, relief="groove", borderwidth=2)
  facframe <- tkframe(frame2, relief="groove", borderwidth=2)
  classframe <- tkframe(frame2, relief="groove", borderwidth=2)
  miscframe <- tkframe(frame2, relief="groove", borderwidth=2)
  limframe <- tkframe(frame3, relief="groove", borderwidth=2)
  posframe <- tkframe(frame3, relief="groove", borderwidth=2)
  legframe <- tkframe(frame3, relief="groove", borderwidth=2)
  optframe <- tkframe(frame4, relief="groove", borderwidth=2)
  origframe <- tkframe(frame4, relief="groove", borderwidth=2)
  gridframe <- tkframe(frame4, relief="groove", borderwidth=2)
  #
  # Variables for text fields
  #
  xyvar <- tclVar()
  facvar <- tclVar()
  wtvar <- tclVar()
  colvar <- tclVar()
  cstarvar <- tclVar()
  nxvar <- tclVar(1)
  nyvar <- tclVar(2)
  labvar <- tclVar()
  clabvar <- tclVar(1)
  pchvar <- tclVar(20)
  cpvar <- tclVar(1)
  xl1var <- tclVar()
  xl2var <- tclVar()
  yl1var <- tclVar()
  yl2var <- tclVar()
  blengthvar <- tclVar(1)
  ellsizevar <- tclVar(1.5)
  cgrvar <- tclVar(1)
  orxvar <- tclVar(0)
  oryvar <- tclVar(0)
  subvar <- tclVar()
  csubvar <- tclVar(1)
  #pmvar <- tclVar()
  spvar <- tclVar()
  #
  # Checkboxes variables
  #
  gridvar <- tclVar(1)
  axesvar <- tclVar(0)
  origvar <- tclVar(1)
  posvar <- tclVar(3)
  addvar <- tclVar(0)
  axellvar <- tclVar(1)
  #
  # Title
  #
  TFrame <- tkframe(tt, relief="groove")
  labh <- tklabel(TFrame, bitmap="questhead")
  tkgrid(tklabel(TFrame,text="Classes", font="Times 18", foreground="red"), labh)
  tkbind(labh, "<Button-1>", function() print(help("s.class")))
  tkpack(TFrame)
  #
  # Coordinates frame
  #
  xy.entry <- tkentry(xyframe, textvariable=xyvar, width=10)
  nx.entry <- tkentry(xyframe, textvariable=nxvar, width=3)
  ny.entry <- tkentry(xyframe, textvariable=nyvar, width=3)
  dfnr.label <- tklabel(xyframe, width=4)
  dfnc.label <- tklabel(xyframe, width=4)
  choosexy.but <- tkbutton(xyframe, text="Set", command=function() choosedf(xy.entry, dfnr.label, dfnc.label))
  tkgrid(tklabel(xyframe, text="- Coordinates -", foreground="blue"), columnspan=5)
  tkgrid(tklabel(xyframe,text="XY Coordinates"), xy.entry, choosexy.but, dfnr.label, dfnc.label)
  tkgrid(tklabel(xyframe,text="X axis col. #"), nx.entry)
  tkgrid(tklabel(xyframe,text="Y axis col. #"), ny.entry)
  #
  # Labels frame
  #
  lab.entry <- tkentry(labframe, textvariable=labvar, width=10)
  clab.entry <- tkentry(labframe, textvariable=clabvar, width=10)
  pch.entry <- tkentry(labframe, textvariable=pchvar, width=10)
  cp.entry <- tkentry(labframe, textvariable=cpvar, width=10)
  chooselab.but <- tkbutton(labframe, text="Set", command=function() chooselab(tt, dfnr.label, lab.entry))
  tkgrid(tklabel(labframe, text="- Labels & symbols -", foreground="blue"), columnspan=3)
  tkgrid(tklabel(labframe,text="Labels"), lab.entry, chooselab.but)
  tkgrid(tklabel(labframe,text="Label size"), clab.entry)
  tkgrid(tklabel(labframe,text="Character #"), pch.entry)
  tkgrid(tklabel(labframe,text="Char. size"), cp.entry)
  
  tkpack(xyframe, labframe, side="left")
  
  tkpack(frame1)
  #
  # Factor frame
  #
  fac.entry <- tkentry(facframe, textvariable=facvar, width=10)
  wt.entry <- tkentry(facframe, textvariable=wtvar, width=10)
  col.entry <- tkentry(facframe, textvariable=colvar, width=10)
  choosefac.but <- tkbutton(facframe, text="Set", command=function() choosefac(fac.entry, dfnr.label))
  choosewt.but <- tkbutton(facframe, text="Set", command=function() choosewt(wt.entry, dfnr.label))
  choosecol.but <- tkbutton(facframe, text="Set", command=function() choosecol(col.entry, facvar))
  tkgrid(tklabel(facframe, text="- Grouping factor -", foreground="blue"), columnspan=3)
  tkgrid(tklabel(facframe,text="Factor"), fac.entry, choosefac.but)
  tkgrid(tklabel(facframe,text="Weights"), wt.entry, choosewt.but)
  tkgrid(tklabel(facframe,text="Colors"), col.entry, choosecol.but)
  
  blength.entry <- tkentry(classframe, textvariable=blengthvar, width=5)
  ellsize.entry <- tkentry(classframe, textvariable=ellsizevar, width=5)
  axell.cbut <- tkcheckbutton(classframe,text="Draw ellipse axes", variable=axellvar)
  tkgrid(tklabel(classframe, text="- Ellipses & stars -", foreground="blue"), columnspan=3)
  tkgrid(axell.cbut)
  tkgrid(tklabel(classframe,text="Star branch length"), blength.entry)
  tkgrid(tklabel(classframe,text="Ellipse size factor"), ellsize.entry)
  #
  # Misc frame
  #
  #pm.entry <- tkentry(miscframe, textvariable=pmvar, width=10, state="disabled")
  sp.entry <- tkentry(miscframe, textvariable=spvar, width=10)
  
  #choosepm.but <- tkbutton(miscframe, text="Set", state="disabled", command=function() choosepm(pm.entry))
  choosesp.but <- tkbutton(miscframe, text="Set", command=function() choosesp(sp.entry))
  
  tkgrid(tklabel(miscframe, text="- Misc. options -", foreground="blue"), columnspan=3)
  #tkgrid(tklabel(miscframe,text="Pixmap"), pm.entry, choosepm.but)
  tkgrid(tklabel(miscframe,text="Spatial object"), sp.entry, choosesp.but)
  
  tkpack(facframe, classframe, miscframe, side="left", expand=1)
  
  tkpack(frame2, fill="x")
  #
  # Limits frame
  #
  xl1.entry <- tkentry(limframe, textvariable=xl1var, width=10)
  xl2.entry <- tkentry(limframe, textvariable=xl2var, width=10)
  yl1.entry <- tkentry(limframe, textvariable=yl1var, width=10)
  yl2.entry <- tkentry(limframe, textvariable=yl2var, width=10)
  tkgrid(tklabel(limframe, text="- Limits -", foreground="blue"), columnspan=2)
  tkgrid(tklabel(limframe,text="X min"), xl1.entry)
  tkgrid(tklabel(limframe,text="X max"), xl2.entry)
  tkgrid(tklabel(limframe,text="Y min"), yl1.entry)
  tkgrid(tklabel(limframe,text="Y max"), yl2.entry)
  #
  # Legend frame
  #
  tkpack(tklabel(posframe, text="- Sub-title position -", foreground="blue"), anchor="w")
  tkpack(tkradiobutton(posframe, text="Top left", value=1, variable=posvar), anchor="w")
  tkpack(tkradiobutton(posframe, text="Top right", value=2, variable=posvar), anchor="w")
  tkpack(tkradiobutton(posframe, text="Bottom left", value=3, variable=posvar), anchor="w")
  tkpack(tkradiobutton(posframe, text="Bottom right", value=4, variable=posvar), anchor="w")
  
  sub.entry <- tkentry(legframe, textvariable=subvar)
  csub.entry <- tkentry(legframe, textvariable=csubvar, width=10)
  tkgrid(tklabel(legframe, text="- Sub-title -", foreground="blue"), columnspan=2)
  tkgrid(tklabel(legframe,text="Sub-title string"), sub.entry)
  tkgrid(tklabel(legframe,text="Sub-title size"), csub.entry)
  
  tkpack(limframe, legframe, posframe, side="left", expand=1)
  tkpack(frame3, fill="x")
  #
  # Options frame
  #
  axes.cbut <- tkcheckbutton(optframe,text="Draw axes", variable=axesvar)
  add.cbut <- tkcheckbutton(optframe,text="Add to plot", variable=addvar)
  tkgrid(tklabel(optframe, text="- Draw options -", foreground="blue"))
  tkgrid(axes.cbut)
  tkgrid(add.cbut)
  
  orig.cbut <- tkcheckbutton(origframe,text="Include origin", variable=origvar)
  orx.entry <- tkentry(origframe, textvariable=orxvar, width=10)
  ory.entry <- tkentry(origframe, textvariable=oryvar, width=10)
  tkgrid(tklabel(origframe, text="- Origin -", foreground="blue"), columnspan=2)
  tkgrid(orig.cbut)
  tkgrid(tklabel(origframe,text="X Origin"), orx.entry)
  tkgrid(tklabel(origframe,text="Y Origin"), ory.entry)
  
  grid.cbut <- tkcheckbutton(gridframe,text="Draw grid", variable=gridvar)
  cgr.entry <- tkentry(gridframe, textvariable=cgrvar, width=10)
  tkgrid(tklabel(gridframe, text="- Grid -", foreground="blue"), columnspan=2)
  tkgrid(grid.cbut)
  tkgrid(tklabel(gridframe,text="Grid legend size"), cgr.entry)
  
  tkpack(optframe, gridframe, origframe, side="left", expand=1)
  
  tkpack(frame4, fill="x")
  #
  # Local variables
  #
  vnr=NULL			# Vector of dataframes row numbers
  vnc=NULL			# Vector of dataframes column numbers
  numi=1				# Number of choosed element
  done <- tclVar(0)	# To terminate the dialog
  
  ################################
  # Function to build the command line from dialog widgets
  ################################
  "build" <- function() {
    l <- list(dfxy = .test1value(tclvalue(xyvar), ""),
              xax = .test1value(tclvalue(nxvar), ""),
              yax = .test1value(tclvalue(nyvar), ""),
              labels = .test1value(tclvalue(labvar), ""),
              plabels.cex = .test1value(tclvalue(clabvar), ""),
              ppoints.pch = .test1value(tclvalue(pchvar), ""),
              ppoints.cex = .test1value(tclvalue(cpvar), ""),
              xlim = .test2values(tclvalue(xl1var), tclvalue(xl2var), ""),
              ylim = .test2values(tclvalue(yl1var), tclvalue(yl2var), ""),
              psub.text = tclvalue(subvar),
              psub.cex = .test1value(tclvalue(csubvar), ""),
              paxes.draw = as.logical(tclObj(axesvar)),          
              add = as.logical(tclObj(addvar)),
              pgrid.draw = as.logical(tclObj(gridvar)),
              pgrid.text.cex = .test1value(tclvalue(cgrvar), ""),
              porigin.include = as.logical(tclObj(origvar)),
              porigin.origin = .test2values(tclvalue(orxvar), tclvalue(oryvar), ""),
              Sp = .test1value(tclvalue(spvar), ""),
              pellipses.axes.draw = as.logical(tclObj(axellvar)),
              starSize = .test1value(tclvalue(blengthvar), ""),
              ellipseSize = .test1value(tclvalue(ellsizevar), ""),
              col = .test1value(tclvalue(colvar), ""),
              wt = .test1value(tclvalue(wtvar), ""),
              fac = .test1value(tclvalue(facvar), as.factor(rep(1, tclvalue(tkcget(dfnr.label, "-text"))))),
              plot = FALSE
    )
    
    if (tclvalue(posvar) == 1) l$psub.position <- "topleft"
    if (tclvalue(posvar) == 2) l$psub.position <- "topright"
    if (tclvalue(posvar) == 3) l$psub.position <- "bottomleft"
    if (tclvalue(posvar) == 4) l$psub.position <- "bottomright"
    
    l <- l[which(l != "")]
    return(do.call("s.class", l))
  }
  
  ################################
  # Function to reset all dialog elements to default values
  ################################
  "reset" <- function()
  {
    tclvalue(xyvar) <- ""
    tclvalue(facvar) <- ""
    tclvalue(wtvar) <- ""
    tclvalue(colvar) <- ""
    tclvalue(cstarvar) <- ""
    tclvalue(nxvar) <- "1"
    tclvalue(nyvar) <- "2"
    tclvalue(labvar) <- ""
    tclvalue(clabvar) <- "1"
    tclvalue(pchvar) <- "20"
    tclvalue(cpvar) <- "1"
    tclvalue(xl1var) <- ""
    tclvalue(xl2var) <- ""
    tclvalue(yl1var) <- ""
    tclvalue(yl2var) <- ""
    tclvalue(blengthvar) <- "1"
    tclvalue(ellsizevar) <- "1.5"
    tclvalue(cgrvar) <- "1"
    tclvalue(orxvar) <- "0"
    tclvalue(oryvar) <- "0"
    tclvalue(subvar) <- ""
    tclvalue(csubvar) <- "1"
    tclvalue(pmvar) <- ""
    tclvalue(spvar) <- ""
    tkconfigure(dfnr.label, text="")
    tkconfigure(dfnc.label, text="")
    tclvalue(gridvar) <- "1"
    tclvalue(axesvar) <- "0"
    tclvalue(origvar) <- "1"
    tclvalue(posvar) <- "3"
    tclvalue(addvar) <- "0"
    tclvalue(axellvar) <- "1"
  }
  
  ################################
  # Function to draw the graphic
  ################################
  "drawgraph" <- function()
  {
    #
    # Build and display the command line so that the user can check it
    #
    cmd <- print(build())
    if (show) {
      #
      # Echoe the command line to the console
      #
      pr1 <- substr(options("prompt")$prompt, 1, 2)
      cat(deparse(cmd@Call, width.cutoff = 500), "\n", pr1, sep="")
    }
    #
    # Execute the command
    #
    eval.parent(cmd)
    assign("cmdlist", c(get("cmdlist", envir=env_ade4tkgui), cmd@Call), envir=env_ade4tkgui)
    if (history) rewriteHistory(deparse(cmd@Call, width.cutoff = 500))
  }
  #
  # Place the three buttons
  #
  RCSFrame <- tkframe(tt, relief="groove")
  reset.but <- tkbutton(RCSFrame, text="Reset", command=reset)
  cancel.but <- tkbutton(RCSFrame, text="Dismiss", command=function() tkdestroy(tt))
  submit.but <- tkbutton(RCSFrame, text="Submit", default="active", command=function() drawgraph())
  tkgrid(cancel.but, submit.but, reset.but, ipadx=20)	
  tkpack(RCSFrame)
  #
  # If window is closed by user, terminate the dialog
  #
  tkbind(tt, "<Destroy>", function() tclvalue(done)<-2)
  tkbind(tt, "<KeyPress-Return>", function() drawgraph())
  tkbind(tt, "<KeyPress-Escape>", function() tkdestroy(tt))
  #
  # User closed the window
  #
  if(tclvalue(done)=="2") return()
}
