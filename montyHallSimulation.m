%%monty hall simulation 1

stay_vec = nan(1,10000)
for i =1:10000%choose car location
    car_loc = randperm(3,1);
    %choose random door
    rand_door = randperm(3,1);
    %host opens a door that is neither the car_loc or the rand_door
    possible_doors = 1:3;
    possible_doors = possible_doors(possible_doors~=car_loc & possible_doors~=rand_door);
    goat_door = possible_doors(randperm(length(possible_doors),1));
    %1 if car is behind the chosen door, 0 otherwise
    stay_vec(i)= car_loc==rand_door;
end
stay_wins = sum(stay_vec)/10000;

%%monty hall simulation 2

stay_vec = [];
for i =1:10000%choose car location
    car_loc = randperm(3,1);
    %choose random door
    rand_door = randperm(3,1);
    %host opens a door that is not the rand_door (can be the car)
    possible_doors = 1:3;
    possible_doors = possible_doors(possible_doors~=rand_door);
    open_door = possible_doors(randperm(length(possible_doors),1));
    %game ends if the car is behind the now open door
    if open_door ==car_loc
        continue
    else
        %1 if car is behind the chosen door, 0 otherwise
        stay_vec= [stay_vec; car_loc==rand_door];
    end
    
end
stay_wins = sum(stay_vec)/length(stay_vec)
