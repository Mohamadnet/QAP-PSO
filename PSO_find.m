function result=PSO_find(pop_no,d,f,iteration,c1,c2,weight)
size_f=size(f);
R=2;
m=size_f(1);
for ii=1:pop_no
    x(ii).indi=round(R*rand(1,m)-R/2);
    v(ii).indi=zeros(1,m);
end

best_fitness=inf;
Best_fitnsss=inf*ones(1,pop_no);
for ii=1:iteration
    
        fitness=genetic_fractal_real_fitness(pop_no,x,d,f);
    for jj=1:pop_no
        if fitness(jj)<Best_fitnsss(jj)
            Best(jj).indi=x(jj).indi;
            Best_fitnsss(jj)=fitness(jj);
        end        
    end
    
    [Gbest_fitness I]=min(Best_fitnsss);
    Gbest=Best(I).indi;
    
%     Gbest=best_indi;
%     fitnesses((ii-1)*pop_no+1:ii*pop_no)=genetic_fitness(best_indi,objective_function);
%     best((ii-1)*pop_no+1:ii*pop_no)=Gbest_fitness;
    result(ii)=Gbest_fitness;
    
    
    for jj=1:pop_no
        Pbest=Best(jj).indi;
        
        v(jj).indi=weight*v(jj).indi+c1*rand(1,m).*(Pbest-x(jj).indi)+c2*rand(1,m).*(Gbest-x(jj).indi);
        x(jj).indi=x(jj).indi+v(jj).indi;
        
        x(jj).indi=max(x(jj).indi,-R/2);
        x(jj).indi=min(x(jj).indi,R/2);
        v(jj).indi=max(v(jj).indi,-R/2);
        v(jj).indi=min(v(jj).indi,R/2);
    end
end