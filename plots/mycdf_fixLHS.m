function cdf_out = mycdf_fixLHS(Data)

of=Data(:,6);
of=of./max(of);                % normalise of
of=1-of;                       % likelihood (high values indicate more likely [probable] models)
if min(of)<0||min(of)==0, of=of-min(of)+1000*eps;end % transform negative lhoods
[~,i]=sort(of);
dat=Data(i,:);

cls=floor(length(dat(:,1)));

tm=dat(1:cls,1);     % -> D
tm=sort(tm);
tmxD(:,1)=tm;
tmyD=((1:length(tmxD))/cls)';

tm=dat(1:cls,2);     % -> alpha
tm=sort(tm);
tmxAlpha(:,1)=tm;
tmyAlpha=((1:length(tmxAlpha))/cls)';

tm=dat(1:cls,3);     % -> A_H
tm=sort(tm);
tmxAH(:,1)=tm;
tmyAH=((1:length(tmxAH))/cls)';

tm=dat(1:cls,7);     % -> qI
tm=sort(tm);
tmxqI(:,1)=tm;
tmyqI=((1:length(tmxqI))/cls)';

cdf_out = [tmxD,tmyD,tmxAlpha,tmyAlpha,tmxAH,tmyAH,tmxqI,tmyqI];