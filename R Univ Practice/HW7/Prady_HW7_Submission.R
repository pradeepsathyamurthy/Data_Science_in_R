# Constructor for ChlorReads object
# Create a constructor ChlorReads that inputs the fields:
# id, name, gender, ldl, hdl, and trigl and returns a ChlorReads object
ChlorReads <- function(id_val, name_val, gender_val, ldl_val, hdl_val, trigl_val){
    chlorReadsobject <- list(id=id_val, name=name_val, gender=gender_val, ldl=ldl_val, hdl=hdl_val, trigl=trigl_val)
    class(chlorReadsobject) <- "ChlorReads"
    return(chlorReadsobject)
}

# Define a print.ChlorReads method that prints a ChlorReads object like this
# > p1 <- ChlorReads(9876, "Virgil", "M", 248, 45, 148)
# > print(p1) 
# ID: 9876  Name: Virgil  Gender: M
# LDL: 248* HDL: 45+  Triglycerides: 148

# LDL 0 to 200 Normal ""
# LDL 200 to 240 Borderline "+"
# LDL 240 and up High Risk "*"

print.ChlorReads <- function(chlorReadsobject){
    
    if(chlorReadsobject$ldl >= 0 & chlorReadsobject$ldl < 200){
        chlorReadsobject$ldl = paste0(chlorReadsobject$ldl,"")
    } else if(chlorReadsobject$ldl >= 200 & chlorReadsobject$ldl < 240){
        chlorReadsobject$ldl = paste0(chlorReadsobject$ldl,"+")
    } else if (chlorReadsobject$ldl >= 240){
        chlorReadsobject$ldl = paste0(chlorReadsobject$ldl,"*")
    }
    
    if(chlorReadsobject$hdl >= 0 & chlorReadsobject$hdl < 40){
        chlorReadsobject$hdl = paste0(chlorReadsobject$hdl,"*")
    } else if(chlorReadsobject$hdl >= 40 & chlorReadsobject$hdl < 60){
        chlorReadsobject$hdl = paste0(chlorReadsobject$hdl,"+")
    } else if (chlorReadsobject$hdl >= 60){
        chlorReadsobject$hdl = paste0(chlorReadsobject$hdl,"")
    }
    
    if(chlorReadsobject$trigl >= 0 & chlorReadsobject$trigl < 150){
        chlorReadsobject$trigl = paste0(chlorReadsobject$trigl,"")
    } else if(chlorReadsobject$trigl >= 150 & chlorReadsobject$trigl < 200){
        chlorReadsobject$trigl = paste0(chlorReadsobject$trigl,"+")
    } else if (chlorReadsobject$trigl >= 200){
        chlorReadsobject$trigl = paste0(chlorReadsobject$trigl,"*")
    }

    cat("ID:",chlorReadsobject$id,"Name:", chlorReadsobject$name,"Gender:", chlorReadsobject$gender, "\n" ,"LDL:", chlorReadsobject$ldl,"HDL:", chlorReadsobject$hdl,"Triglycerides:", chlorReadsobject$trigl,"\n")
}

p1 <- ChlorReads(9876, "Virgil", "M", 248, 45, 148)
print(p1)

# Define the method plot.ChlorReads that plots the data in the ChlorReads object like this

