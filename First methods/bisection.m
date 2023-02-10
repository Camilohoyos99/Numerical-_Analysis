x = linspace(-2,2,100);
y = Fx1(x);
a = 1;
b = 2;
err = inf;

names = ["a","b", "Fa","Fb","c","Fc","err"];
disp(names)
for i=1 :1000
    if i > 1
        pn = c;
        c = (a+b)/2;
        pn1 = c;
        err = (abs(pn -pn1)/pn) *100;
        
        if err < 2.0
            break
        end
        
    end

    c = (a+b)/2;
    fa = Fx1(a);
    fb = Fx1(b);
    fc = Fx1(c);

    
    data =[a b fa fb c fc err];
    disp(data)

    if fa * fc < 0
        b = c;
    end
    
    if fb * fc < 0
        a = c;
    end
  
        

end