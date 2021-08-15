% figure(1);
% % p1=imread('low_000001.bmp');
% % I1=imshow(p1);
% % figure(2);
% % p2=imread('f_000001_tm1.bmp');
% % I2=imshow(p2);
% %
% % KK=imread('f_000001_tm1.bmp');
% % K1=wrapedphase(:,:,1);
% %
%
% % C1=C(:,:,1);
% % K1=C(:,:,1);
%
% % [J, rect] = imcrop(I);
% % s1='f_';s2='.bmp';s3='crop_';
% % v1='low_';
% rect=[200,141,177,174];
% % %crop and write crop_images
% %read cropimage
% % for n=1:100
% %     if n<10
% %         m='00000';
% %     elseif n>9 && n<100
% %         m='0000';
% %     else
% %         m='000';
% %     end
% %     ms=int2str(n);
% %     name3=strcat('low_',m,ms,s2);
% % %      pic(:,:,n)=imread(name3);
% % %     name=strcat(s1,m,ms,s2);
% %      name2=strcat('crop_',m,ms,s2);
% % % %     I(:,:,n)=imread(name);
% % % %      cropimage(:,:,n)=imcrop(I(:,:,n),rect);
% % cropimages(:,:,n)=imread(name2);
% % %     imwrite(cropimage(:,:,n),name2);
% % end
% %%
% % %%%%%%%%lowpass
% % h=size(cropimages(:,:,1),1);
% % w=size(cropimages(:,:,1),2);
% % frame=size(cropimages,3);
% % u=-h/2:(h/2-1);
% % v=-w/2:(w/2-1);
% % D0=20;
% % [U,V]=meshgrid(v,u);
% % D=sqrt(U.^2+V.^2);
% % N=6;
% % H=1./(1+(D./D0).^(2*N));
% % v1='low_';v2='.bmp';
% % for n=1:frame
% %     J=fftshift(fft2(cropimages(:,:,n),h,w));
% %     K=J.*H;
% %     L=ifft2(ifftshift(K));
% %     L=L(1:h,1:w);
% %     %已知为100帧
% %       if n<10
% %         m='00000';
% %     elseif n>9 && n<100
% %         m='0000';
% %     else
% %         m='000';
% %       end
% %       ms=int2str(n);
% %     name=strcat(v1,m,ms,v2);
% %     lowpassimages(:,:,n)=abs(L)/256;
% %     imwrite(lowpassimages(:,:,n),name);
% %
% % end
% % %%%%%%%%%%%%%%low1=lowpassimages(:,:,1);
%
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % load('grayvalue.txt');load('wrap.txt');load('phase.txt');
% % load('min.txt');load('max.txt');load('phaselinex116.txt');
% % X=1:100;
% % Y=[grayvalue min max wrap phase];
% % newYlabels = {'原信号','min','max','包裹','解包裹'};
% % % stackedplot(outdoors,'Title','Weather Data','DisplayLabels',newYlabels);
% % figure(3);
% % stackedplot(X,Y,'DisplayLabels',newYlabels);
%
%
% %%read lowpassimages
for n=1:100
    if n<10
        m='00000';
    elseif n>9 && n<100
        m='0000';
    else
        m='000';
    end
    ms=int2str(n);
    name3=strcat('low_',m,ms,'.bmp');
    pic(:,:,n)=double(imread(name3));
    kk(n)=pic(100,100,n);
end
h=175;w=178;
% %test
% % A=[1 2 3;2 5 6];
% % whos A;
% I1=pic(:,:,50);
% I2=imread('f_000001_tm1.bmp');
% l211=I2(1,:);
%
%
% K=pic(:,:,1);
% %%
% %%%%%%%%%%%%%%%%%%%%%%%%   max      min   %%%%%%%%%%%%%%%%%%%%%%%%

% % for i=1:h
% %     for j=1:w
% %         for n=2:99
% %             ka=0;ki=0; %ka mean k-max number
% %            if ((pic(i,j,n)>=pic(i,j,n-1) &&  pic(i,j,n)>=pic(i,j,n+1))&& pic(i,j,n)>75)
% %                ka=ka+1;
% %                MAX(i,j,n)=pic(i,j,n);
% %                MAXa(i,j,ka)=pic(i,j,n);
% %                if ka==1
% %                MAXb(i,j)=n-1;  %record first 0 stage end frame
% %                end
% %            end
% %                if (pic(i,j,n)<=pic(i,j,n-1) &&  pic(i,j,n)<=pic(i,j,n+1))
% %                    ki=ki+1;
% %                    MIN(i,j,n)=pic(i,j,n);
% %                     MINi(i,j,ki)=pic(i,j,n);
% %                       if kb==1
% %                MINb(i,j)=n-1;  %record first 0 stage end frame
% %                end
% %                end
% %         end
% %         %interp
% %         for k=1:100
% %             if k<=MAXb(i,j)
% %                 MAX(i,j,k)=MAXa(i,j,1);
% %             elseif MAX(i,j,k)==MAXa(i,j,size(MAXa(i,j,:)))
% %                 for w=1:
% %                 for q=1:size(MAXa(i,j,:))
% %
% %             elseif ~MAX(i,j,k)
% %                     MAX(i,j,k)=
% %             if (MAX(i,j,k)~=MAXa(i,j,1))
% %                 MAX(i,j,k)=MAXa(i,j,1);
% %             end
% %             if ~MAX(i,j,k)
% %
% %     end
% %                 end
% % MINn=zeros(175,178,100);MINi=zeros(175,178,100);
% % % nMin=zeros(175,178,100);
% % MAXn=zeros(175,178,100);MAXn=zeros(175,178,100);
% % % nMax=zeros(175,178,100);
%
for i=1:h
    for j=1:(w)
        
        Max(i,j)=max(pic(i,j,:));
        Min(i,j)=min(pic(i,j,:));
    end
end
MA=zeros(h,w,100);
MI=MA;MAXi=MI;MINi=MI;
for i=1:h
    for j=1:w
        %  find max and max_number
        %ka means k-max number
        for k=1:100
            var={'MAXn','MINn','X','N'};
            clear(var{:});
            ka=0;ki=0;
            for n=1:100
                if n==1 || n==100
                    continue;
                end
                if (pic(i,j,n)>=pic(i,j,n-1) &&  pic(i,j,n)>=pic(i,j,n+1))&&((Max(i,j)-pic(i,j,n))<=5)
                    ka=ka+1;
                    %                 MA(i,j,n)=pic(i,j,n);
                    MAXn(ka+1)=n;
                    if ka==1
                        X(1)=pic(i,j,n);MAXn(1)=n;
                    end
                    X(ka+1)=pic(i,j,n);
                end
                if (pic(i,j,n)<=pic(i,j,n-1) &&  pic(i,j,n)<=pic(i,j,n+1)&&(pic(i,j,n)-Min(i,j))<=5)
                    ki=ki+1;
                    %                 MI(i,j,n)=pic(i,j,n);
                    if ki==1
                        N(1)=pic(i,j,n);MINn(1)=n;
                    end
                    MINn(ki)=n;
                    N(ki)=pic(i,j,n);
                end
            end
            X(ka+1)=pic(i,j,ka);MAXn(1)=n;
            N(ki+1)=pic(i,j,ki);MINn(ki+1)=100;

            
                
            %   front and back
            %         nMax=setdiff(1:100,MAXn);
            %         nMin=setdiff(1:100,MINn);
            %                 s1=size(MAXn(i,j,:),3);s2=size(MINn(i,j,:),3);
            %         MAXa(i,j,1)=MAXa(i,j,2);MAXa(i,j,s1+1)=MAXa(i,j,s1);
            %         MINi(i,j,1)=MINi(i,j,2);MINi(i,j,s2+1)=MINi(i,j,s2);
            %         %record number needing to interp
            %         k1=0;k2=0;k3=MAXn(i,j,1);k4=MINn(i.j,1);
            %         for n=1:100
            %             for k3=1:s1
            %             if n~=MAXn(i,j,k3)
            %                 k1=k1+1;
            %                 nMax(i,j,k1)=n;
            %             end
            %             if n~=MINn(i,j,n)
            %                 k2=k2+1;
            %                 nMin(i,j,k2)=n;
            %             end
            %  interp
            
            MAX(i,j,:)=interp1(MAXn,X,1:100);
            MIN(i,j,:)=interp1(MINn,N,1:100);
            % MIN(i,j,:)=interp1(MINn(i,j,:),MINi(i,j,:),nMin(i,j,:));
        end
    end
    
end
% MAX=MA+MAXi;
% MIN=MI+MINi;
% k1=reshape(pic(1,1,:),[1,100]);
% k100=reshape(pic(100,100,:),[1,100]);
%
kk2a(:)=MAXi(85,4,:);
kk2i(:)=MINi(85,4,:);
q(:)=pic(85,4,:);

XX=1:100;
Y=[kk2a;kk2i;q].';
stackedplot(XX,Y);




%
%
% for k=1:100
%
%     for i=1:h
%     for j=1:(w)
%
%             C(i,j,k)=double((2*pic(i,j,k)-Max(i,j)-Min(i,j))/(Max(i,j)-Min(i,j)));
%             wrapedphase(i,j,k)=acos(C(i,j,k));
%                         if k~=100
%                             if pic(i,j,k)<pic(i,j,k+1)
%                                 wrapedphase2(i,j,k)=2*pi-wrapedphase(i,j,k);
%                             else
%                                 wrapedphase2(i,j,k)=wrapedphase(i,j,k);
%                             end
%                         else
%                             if pic(i,j,k)<pic(i,j,k-1)
%                             wrapedphase2(i,j,k)=wrapedphase(i,j,k);
%                             else
%                              wrapedphase2(i,j,k)=2*pi-wrapedphase(i,j,k);
%                             end
%                         end
%
%         end
%     end
% end
% w1=wrapedphase(:,:,1);
% C2=C(:,:,1);
% %%
%     unwrapedphase(:,:,:)=unwrap(wrapedphase2,[],1);
% for k=1:100
%
%     min_unwrapedphase(k)=min(reshape(unwrapedphase(:,:,k),[178*h,1]));
%     max_unwrapedphase(k)=max(reshape(unwrapedphase(:,:,k),[178*h,1]));
%
% end
% CC=unwrapedphase(:,:,25);
% for k=1:100
%
%     for i=1:h
%     for j=1:(w-1)
%             normalized_unwrapedphase(i,j,k)=(unwrapedphase(i,j,k)-min_unwrapedphase(k))/(max_unwrapedphase(k)-min_unwrapedphase(k));
%
%         end
%     end
% end
%
%
% for k=20:25
%     figure(k);
%     subplot(131);
%     imshow(pic(:,:,k)/256);
%     title('低通');
%     subplot(132);
%     imshow(wrapedphase2(:,:,k)/2/pi);
%     title('0~2\pi');
%      subplot(133);
%     imshow((normalized_unwrapedphase(:,:,k)));
%     title('解包裹');
% end
% un25=normalized_unwrapedphase(:,:,25);
% wrap25=wrapedphase2(:,:,25);
% pic25=pic(:,:,25);
% figure(50);
% imshow(wrapedphase2(:,:,25)/2/pi);
% ku=normalized_unwrapedphase(:,1,25);
% kw=wrapedphase2(:,1,25);
% kw2=wrapedphase2(:,2,25);
%
%
%
% kk1=reshape(wrapedphase(100,100,:),[1,100]);
% kk2=reshape(wrapedphase2(100,100,:),[1,100]);
% kk3=unwrap(kk2);
% figure(1);
% subplot(221);plot(kk1);
% title('0~\pi');
% subplot(222);plot(kk);
% title('沿时间轴100个点的信号');
% subplot(223);plot(kk2);
% title('0~2\pi');
% subplot(224);
% plot(kk3);
% title('展开相位');
%
% % % wrapedphase2=image_normalize(wrapedphase2);
% % % s1='w2';s2='.bmp';
% % % for n=1:100
% % %
% % %      if(n<10)
% % %         m='00000';
% % %     elseif(n>9 && n<100)
% % %         m='0000';
% % %     else
% % %         m='000';
% % %     end
% % %     ms=int2str(n);
% % %     name2=strcat(s1,m,ms,s2);
% % %     imwrite(wrapedphase2(:,:,n),name2);
% % % end
% %
% % myobj= VideoWriter('myvideo5.avi');
% % myobj.FrameRate = 5;
% % open(myobj)
% %
% % for k=1:100
% %     writeVideo(myobj, normalized_unwrapedphase(:,:,k));
% % end
% % close(myobj)