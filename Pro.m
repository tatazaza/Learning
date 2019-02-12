clc
clear all
close all

data = csvread('Skin_NonSkin_Full.csv');
 data_2 = csvread('idx_1.csv');
 data_3 = csvread('idx_2.csv');
 data_4 = csvread('idx_3.csv');

RGB(:,1) = data(:,1);
RGB(:,2) = data(:,2);
RGB(:,3) = data(:,3);
SK = data(:,4);
 idx = data_2(:,1);
 idx_1 = data_3(:,1);
 idx_2 = data_4(:,1);

sizeim = round(sqrt(length(RGB)));
image = ones(sizeim,sizeim,3, 'uint8');
image2 = ones(sizeim,sizeim,3, 'uint8');
c = 1;
for i=1:sizeim
    for j=1:sizeim
                 image(i,j,1)= RGB(c,3);   %Red (dark red)
                 image(i,j,2)= RGB(c,2);   %Red (maximum value)
                 image(i,j,3)= RGB(c,1);  %Green
                 c = c+1;
    end
end


s1 = RGB(idx==1,1);
d1 = RGB(idx==1,2);
b1 = RGB(idx==1,3);

s2 = RGB(idx==2,1);
d2 = RGB(idx==2,2);
b2 = RGB(idx==2,3);

s3 = RGB(idx==3,1);
d3 = RGB(idx==3,2);
b3 = RGB(idx==3,3);

sizeim2 = round(sqrt(length(b1)));
sizeim3 = round(sqrt(length(b2)));
sizeim4 = round(sqrt(length(b3)));

image3 = ones(sizeim2 ,sizeim2 ,3, 'uint8');
image4 = ones(sizeim3 ,sizeim3 ,3, 'uint8');
image5 = ones(sizeim4 ,sizeim4 ,3, 'uint8');
o = 1;
o2 = 1;
o3 = 1;
for i=1:sizeim2
    for j=1:sizeim2
        if o <= length(s1)
            image3(i,j,1)= b1(o,1);   %Red (dark red)
            image3(i,j,2)= d1(o,1);   %Red (maximum value)
            image3(i,j,3)= s1(o,1);  %Green
            o = o+1;
        end
    end
end
for i=1:sizeim3
    for j=1:sizeim3
        if o2 <= length(s2)
            image4(i,j,1)= b2(o2,1);   %Red (dark red)
            image4(i,j,2)= d2(o2,1);   %Red (maximum value)
            image4(i,j,3)= s2(o2,1);  %Green
            o2 = o2+1;
        end
    end
end
for i=1:sizeim4
    for j=1:sizeim4
        if o3 <= length(s3)
            image5(i,j,1)= b3(o3,1);   %Red (dark red)
            image5(i,j,2)= d3(o3,1);   %Red (maximum value)
            image5(i,j,3)= s3(o3,1);  %Green
            o3 = o3+1;
        end
    end
end

figure(1)
subplot(2,2,1), imshow(image3)
subplot(2,2,2), imshow(image4)
subplot(2,2,3), imshow(image5)
% 
newk = double(image5);
nrows = size(newk,1);
ncols = size(newk,2);
ab = reshape(newk,nrows*ncols,3);

% % % 
b_k = ab(idx_1 ==1,3);
g_k = ab(idx_1 ==1,2);
r_k = ab(idx_1 ==1,1);

b_k_2 = ab(idx_1 ==2,3);
g_k_2 = ab(idx_1 ==2,2);
r_k_2 = ab(idx_1 ==2,1);

b_k_3 = ab(idx_1 ==3,3);
g_k_3 = ab(idx_1 ==3,2);
r_k_3 = ab(idx_1 ==3,1);

sizeim7 = round(sqrt(length(r_k)));
sizeim8 = round(sqrt(length(r_k_2)));
sizeim9 = round(sqrt(length(r_k_3)));
image7 = ones(sizeim7 ,sizeim7 ,3, 'uint8');
image8 = ones(sizeim8 ,sizeim8 ,3, 'uint8');
image9 = ones(sizeim9 ,sizeim9 ,3, 'uint8');
o9 = 1;
oi = 1;
oio = 1;
for i=1:sizeim7
    for j=1:sizeim7
        if o9 <= length(r_k)
            image7(i,j,1)= r_k(o9,1);   %Red (dark red)
            image7(i,j,2)= g_k(o9,1);   %Red (maximum value)
            image7(i,j,3)= b_k(o9,1);  %Green
            o9 = o9+1;
        end
    end
end

for i=1:sizeim8
    for j=1:sizeim8
        if oi <= length(r_k_2)
            image8(i,j,1)= r_k_2(oi,1);   %Red (dark red)
            image8(i,j,2)= g_k_2(oi,1);   %Red (maximum value)
            image8(i,j,3)= b_k_2(oi,1);  %Green
            oi = oi+1;
        end
    end
end

for i=1:sizeim9
    for j=1:sizeim9
        if oio <= length(r_k_3)
            image9(i,j,1)= r_k_3(oio,1);   %Red (dark red)
            image9(i,j,2)= g_k_3(oio,1);   %Red (maximum value)
            image9(i,j,3)= b_k_3(oio,1);  %Green
            oio = oio+1;
        end
    end
end
figure(2)
subplot(2,2,1), imshow(image7)
subplot(2,2,2), imshow(image8)
subplot(2,2,3), imshow(image9)
% % % 
newk_2 = double(image7);
nrows_2 = size(newk_2,1);
ncols_2 = size(newk_2,2);
ab_2 = reshape(newk_2,nrows_2*ncols_2,3);


% 
% 
b_k_2 = ab_2(idx_2 ==1,3);
g_k_2 = ab_2(idx_2 ==1,2);
r_k_2 = ab_2(idx_2 ==1,1);

b_k_2_2 = ab_2(idx_2 ==2,3);
g_k_2_2 = ab_2(idx_2 ==2,2);
r_k_2_2 = ab_2(idx_2 ==2,1);

b_k_3_2 = ab_2(idx_2 ==3,3);
g_k_3_2 = ab_2(idx_2 ==3,2);
r_k_3_2 = ab_2(idx_2 ==3,1);

sizeim10 = round(sqrt(length(r_k_2)));
sizeim11 = round(sqrt(length(r_k_2_2)));
sizeim12 = round(sqrt(length(r_k_3_2)));
image10 = ones(sizeim10 ,sizeim10 ,3, 'uint8');
image11 = ones(sizeim11 ,sizeim11 ,3, 'uint8');
image12 = ones(sizeim12 ,sizeim12 ,3, 'uint8');

o_2_1 = 1;
o_2_2 = 1;
o_2_3 = 1;
for i=1:sizeim10
    for j=1:sizeim10
        if o_2_1 <= length(r_k_2)
            image10(i,j,1)= r_k_2(o_2_1,1);   %Red (dark red)
            image10(i,j,2)= g_k_2(o_2_1,1);   %Red (maximum value)
            image10(i,j,3)= b_k_2(o_2_1,1);  %Green
            o_2_1 = o_2_1+1;
        end
    end
end

for i=1:sizeim11
    for j=1:sizeim11
        if o_2_2 <= length(r_k_2_2)
            image11(i,j,1)= r_k_2_2(o_2_2,1);   %Red (dark red)
            image11(i,j,2)= g_k_2_2(o_2_2,1);   %Red (maximum value)
            image11(i,j,3)= b_k_2_2(o_2_2,1);  %Green
            o_2_2 = o_2_2+1;
        end
    end
end

for i=1:sizeim12
    for j=1:sizeim12
        if o_2_3 <= length(r_k_3_2)
            image12(i,j,1)= r_k_3_2(o_2_3,1);   %Red (dark red)
            image12(i,j,2)= g_k_3_2(o_2_3,1);   %Red (maximum value)
            image12(i,j,3)= b_k_3_2(o_2_3,1);  %Green
            o_2_3 = o_2_3+1;
        end
    end
end
figure(3)
subplot(2,2,1), imshow(image10)
subplot(2,2,2), imshow(image11)
subplot(2,2,3), imshow(image12)
% 
% newk_3 = double(image4);
% nrows_3 = size(newk_3,1);
% ncols_3 = size(newk_3,2);
% ab_3 = reshape(newk_3,nrows_3*ncols_3,3);
% 
% [idx_1_3, cluster_center_3] = kmeans(ab_3,3);
% 
% b_k_3 = ab_3(idx_1_3 ==1,3);
% g_k_3 = ab_3(idx_1_3 ==1,2);
% r_k_3 = ab_3(idx_1_3 ==1,1);
% 
% b_k_2_3 = ab_3(idx_1_3 ==2,3);
% g_k_2_3 = ab_3(idx_1_3 ==2,2);
% r_k_2_3 = ab_3(idx_1_3 ==2,1);
% 
% b_k_3_3 = ab_3(idx_1_3 ==3,3);
% g_k_3_3 = ab_3(idx_1_3 ==3,2);
% r_k_3_3 = ab_3(idx_1_3 ==3,1);
% 
% sizeim13 = round(sqrt(length(r_k_3)));
% sizeim14 = round(sqrt(length(r_k_2_3)));
% sizeim15 = round(sqrt(length(r_k_3_3)));
% image13 = ones(sizeim13 ,sizeim13 ,3, 'uint8');
% image14 = ones(sizeim14 ,sizeim14 ,3, 'uint8');
% image15 = ones(sizeim15 ,sizeim15 ,3, 'uint8');
% 
% o_3_1 = 1;
% o_3_2 = 1;
% o_3_3 = 1;
% for i=1:sizeim13
%     for j=1:sizeim13
%         if o_3_1 <= length(r_k_3)
%             image13(i,j,1)= r_k_3(o_3_1,1);   %Red (dark red)
%             image13(i,j,2)= g_k_3(o_3_1,1);   %Red (maximum value)
%             image13(i,j,3)= b_k_3(o_3_1,1);  %Green
%             o_3_1 = o_3_1+1;
%         end
%     end
% end
% 
% for i=1:sizeim14
%     for j=1:sizeim14
%         if o_3_2 <= length(r_k_2_3)
%             image14(i,j,1)= r_k_2_3(o_3_2,1);   %Red (dark red)
%             image14(i,j,2)= g_k_2_3(o_3_2,1);   %Red (maximum value)
%             image14(i,j,3)= b_k_2_3(o_3_2,1);  %Green
%             o_3_2 = o_3_2+1;
%         end
%     end
% end
% 
% for i=1:sizeim15
%     for j=1:sizeim15
%         if o_3_3 <= length(r_k_3_3)
%             image15(i,j,1)= r_k_3_3(o_3_3,1);   %Red (dark red)
%             image15(i,j,2)= g_k_3_3(o_3_3,1);   %Red (maximum value)
%             image15(i,j,3)= b_k_3_3(o_3_3,1);  %Green
%             o_3_3 = o_3_3+1;
%         end
%     end
% end
% figure(4)
% subplot(2,2,1), imshow(image13)
% subplot(2,2,2), imshow(image14)
% subplot(2,2,3), imshow(image15)
% 
% newk_4 = double(image13);
% nrows_4 = size(newk_4,1);
% ncols_4 = size(newk_4,2);
% ab_4 = reshape(newk_4,nrows_4*ncols_4,3);
% 
% [idx_1_4, cluster_center_4] = kmeans(ab_4,3);
% 
% 
% b_k_4 = ab_3(idx_1_4 ==1,3);
% g_k_4 = ab_3(idx_1_4 ==1,2);
% r_k_4 = ab_3(idx_1_4 ==1,1);
% 
% b_k_2_4 = ab_3(idx_1_4 ==2,3);
% g_k_2_4 = ab_3(idx_1_4 ==2,2);
% r_k_2_4 = ab_3(idx_1_4 ==2,1);
% 
% b_k_3_4 = ab_3(idx_1_4 ==3,3);
% g_k_3_4 = ab_3(idx_1_4 ==3,2);
% r_k_3_4 = ab_3(idx_1_4 ==3,1);
% 
% sizeim16 = round(sqrt(length(r_k_4)));
% sizeim17 = round(sqrt(length(r_k_2_4)));
% sizeim18 = round(sqrt(length(r_k_3_4)));
% image16 = ones(sizeim16 ,sizeim16 ,3, 'uint8');
% image17 = ones(sizeim17 ,sizeim17 ,3, 'uint8');
% image18 = ones(sizeim18 ,sizeim18 ,3, 'uint8');
% 
% o_4_1 = 1;
% o_4_2 = 1;
% o_4_3 = 1;
% for i=1:sizeim16
%     for j=1:sizeim16
%         if o_4_1 <= length(ab_4(idx_1_4 ==1,1))
%             image16(i,j,1)= r_k_4(o_4_1,1);   %Red (dark red)
%             image16(i,j,2)= g_k_4(o_4_1,1);   %Red (maximum value)
%             image16(i,j,3)= b_k_4(o_4_1,1);  %Green
%             o_4_1 = o_4_1+1;
%         end
%     end
% end
% 
% for i=1:sizeim17
%     for j=1:sizeim17
%         if o_4_2 <= length(ab_4(idx_1_4 ==2,1))
%             image17(i,j,1)= r_k_2_4(o_4_2,1);   %Red (dark red)
%             image17(i,j,2)= g_k_2_4(o_4_2,1);   %Red (maximum value)
%             image17(i,j,3)= b_k_2_4(o_4_2,1);  %Green
%             o_4_2 = o_4_2+1;
%         end
%     end
% end
% 
% for i=1:sizeim18
%     for j=1:sizeim18
%         if o_4_3 <= length(ab_4(idx_1_4 ==3,1))
%             image18(i,j,1)= r_k_3_4(o_4_3,1);   %Red (dark red)
%             image18(i,j,2)= g_k_3_4(o_4_3,1);   %Red (maximum value)
%             image18(i,j,3)= b_k_3_4(o_4_3,1);  %Green
%             o_4_3 = o_4_3+1;
%         end
%     end
% end
% 
% figure(5)
% subplot(2,2,1), imshow(image16)
% subplot(2,2,2), imshow(image17)
% subplot(2,2,3), imshow(image18)