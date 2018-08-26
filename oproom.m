%MCMC simulation for the Schmitz and Kwak study of the Deaconesse Hospital
function [J,K,L,M] = oproom(numbor, p)
surgtime = zeros(1,32);
surgtype = zeros(1,32);

for i = 1:32
    if p(i) <= 157
        surgtime(i) = 0.5; %ENT
        surgtype(i) = 1;
    elseif p(i) <= 241
        surgtime(i) = 0.5; %Urology (To RR)
        surgtype(i) = 2;
    elseif p(i) <= 326
        surgtime(i) = 0.5; %Urology (No RR)
        surgtype(i) = 3;
    elseif p(i) <= 384
        surgtime(i) = 0.5; %Opthalmology (No RR)
        surgtype(i) = 4;
    elseif p(i) <= 620
        surgtime(i) = 0.75; %Other Surgery Type 1
        surgtype(i) = 5;        
    elseif p(i) <= 766
        surgtime(i) = 1.25; % Other Surgery Type 2
        surgtype(i) = 6;
    elseif p(i) <= 856
        surgtime(i) = 1.75; % Other Surgery Type 3
        surgtype(i) = 7;
    elseif p(i) <= 911
        surgtime(i) = 2.25; % Other Surgery Type 4
        surgtype(i) = 8;
    elseif p(i) <= 945
        surgtime(i) = 2.75; % Other Surgery Type 5
        surgtype(i) = 9;
    elseif p(i) <= 966
        surgtime(i) = 3.25; % Other Surgery Type 6
        surgtype(i) = 10;
    elseif p(i) <= 979
        surgtime(i) = 3.75; % Other Surgery Type 7
        surgtype(i) = 11;
    else
        surgtime(i) = 4; % Other Surgery Type 8
        surgtype(i) = 12;
    end
end

rectime = zeros(1,32);

for j = 1:32
    if surgtype(j) <= 2
        rectime(j) = 1.5;
    elseif surgtype(j) >= 5
        rectime(j) = 3;
    else 
        rectime(j) = 0;
    end
end

time = 7.5; %starting surgery time from assumption at 7:30AM

or = zeros(1,numbor); %operating room
surgstart = zeros(1,32); % when surgery begins
surgend = zeros(1,32); %at what time surgery ends
orubp = zeros(1,32); %operating room used by each patient
opend = zeros(1,numbor); %end of operations

for k = 1:32
    surgstart(k) = time;
    surgend(k) = time + surgtime(k);
    h = 0;
    while h == 0
        for m = 1:numbor
            if or(m) == 0
                h = 1;
            end
        end
        if h == 0
            time = time + 0.25;
            for l = 1:numbor
                if opend(l) <= time - 0.25
                    or(l) = 0;
                end
            end
        else
            j = 1;
            while or(j) ~= 0
                j = j + 1;
            end
            orubp(k) = j;
            or(j) = 1;
            opend(j) = surgend(k);
        end
    end
end
recstart = zeros(1,32);
recend = zeros(1,32);
free = zeros(1,32);

for k = 1:32
    recstart(k) = surgend(k) + 0.08;
    recend(k) = recstart(k) + rectime(k);
    free(k) = recend(k) + .25;
end

latestrec = max(recend);
numbstep = round(4*(latestrec - 7.83)); %number of steps
bedtime = 8.08:0.25:latestrec;
bed = zeros(1,numbstep);
maxbeds = 6;
nursehrs = 2*ceil(latestrec - 7.5);
extranurse = zeros(1,numbstep);

%let's keep track of beds
for n = 1:numbstep
    if n >= 2
        bed(n) = bed(n-1);
    end
    for k = 1:32
        if recstart(k) == bedtime(n)
            bed(n) = bed(n) + 1;
        end
        if recend(k) == bedtime(n) - 0.25
            bed(n) = bed(n) - 1;
        end
    end
    if n >= 5
       maxbeds = maxbeds - 3*extranurse(n-4);
    end
    while maxbeds < bed(n)
        maxbeds = maxbeds + 3;
        nursehrs = nursehrs + 1;
        extranurse(n) = extranurse(n) + 1;
    end    
end

J = max(surgend);
K = latestrec;
L = mean(opend) - 7.5;
M = nursehrs;
end