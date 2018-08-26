%running oproom 100 times for numbor=4 and numbor=5
U = 100;
longtimeopr = zeros(2,U);
longtimerecr = zeros(2,U);
avgtimeopr = zeros(2,U);
nursehrs = zeros(2,U);

for k = 1:U
    p = floor(1000*rand(1,32));
    [longtimeopr(1,k),longtimerecr(1,k),avgtimeopr(1,k),nursehrs(1,k)] = oproom(4,p);
    [longtimeopr(2,k),longtimerecr(2,k),avgtimeopr(2,k),nursehrs(2,k)] = oproom(5,p);
end
% longtimeopr %latest time operation rooms are open for U=2, Prob 1, part a
% longtimerecr %latest time recovery rooms are open for U=2, Prob 1, part a
% avgtimeopr %average time that the operating rooms are open for U=2
% nursehrs %number of nursing hours that are required to staff the recovery room for U=2, Prob 1, part b
 
  mean(longtimeopr(1,:)) %mean longest time operating rooms used, 4-room case
  std(longtimeopr(1,:)) %standard deviation for above case
  mean(longtimerecr(1,:)) %mean longest time recovery room used, 4-room case
  std(longtimerecr(1,:)) %standard deviation above case
  mean(avgtimeopr(1,:)) %mean average time operating room used, 4-room case
  std(avgtimeopr(1,:)) %standard deviation for above case
  mean(nursehrs(1,:))%mean nursing hours
  std(nursehrs(1,:))%standard deviation for above value
  
  mean(longtimeopr(2,:)) %mean longest time operating rooms used, 5-room case
  std(longtimeopr(2,:)) %standard deviation for above case
  mean(longtimerecr(2,:))%mean longest time recovery room used, 5-room case
  std(longtimerecr(2,:))%standard deviation above case
  mean(avgtimeopr(2,:))%mean average time operating room used, 5-room case
  std(avgtimeopr(2,:))%standard deviation for above case
  mean(nursehrs(2,:))%mean nursing hours
  std(nursehrs(2,:))%standard deviation for above value