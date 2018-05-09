{-# LANGUAGE ParallelListComp #-}
main =
  let  
    b[1]=36
    b[2]=12
    b[3]=(-180)
    
    l[1,1]=1
    l[2,1]=2
    l[3,1]=5
    l[1,2]=0
    l[2,2]=1
    l[3,2]=6
    l[1,3]=0
    l[2,3]=0
    l[3,3]=1    

    u[1,1]=1
    u[2,1]=0
    u[3,1]=0
    u[1,2]=8
    u[2,2]=(-15)
    u[3,2]=0
    u[1,3]=10
    u[2,3]=(-9)
    u[3,3]=(-10)   
       
    y[1]=b[1]/l[1,1]
    y[2]=1/l[2,2]*(b[2]-l[2,1]*y[1])
    y[3]=1/l[3,3]*(b[3]-l[3,1]*y[1]-l[3,2]*y[2])

    x[3]=y[3]/u[3,3]
    x[2]=1/u[2,2]*(y[2]-u[2,3]*x[3])
    x[1]=1/u[1,1]*(y[1]-u[1,2]*x[2]-u[1,3]*x[3])
    xList=[sqrt(x[i]) | i<-[1,2,3]]

  in do
    writeFile "Problem3.csv" 
      (concat[show i ++ ", " ++ show ex ++ "\n"  
        | i <- [1,2,3]
        | ex <- xList])

 