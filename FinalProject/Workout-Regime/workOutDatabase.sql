drop database Workout;
create database Workout;
use Workout;


-- ********************************************************************************************
-- ************************************* CREATE ALL TABLES ************************************
-- ********************************************************************************************

-- muscleGroup table
CREATE TABLE muscleGroup
(
    muscleGroupId tinyint not null auto_increment primary key,
    name varchar(80) not null 
);
-- *********************************************************************************************

-- muscle table
CREATE TABLE muscle
(
    muscleId tinyint not null auto_increment primary key,
    name varchar(80) not null,
    muscleGroupId tinyint not null,
    foreign key (muscleGroupId) references muscleGroup(muscleGroupId)
);
 -- ********************************************************************************************
 
-- equipment table 
CREATE TABLE equipment
(
    equipmentId tinyint not null auto_increment primary key,
    name varchar(80) not null
);
 -- ********************************************************************************************

-- exercise table
CREATE TABLE exercise
(
    exerciseId tinyint not null auto_increment primary key,
    name varchar(80) not null,
    description varchar(255) not null,
    muscleGroup tinyint not null,
    foreign key (muscleGroup) references muscleGroup(muscleGroupId),
    equipmentId tinyint not null,
    foreign key (equipmentId) references equipment(equipmentId)
);
-- ********************************************************************************************

-- exerciseMuscle table
CREATE TABLE exerciseMuscle
(
    exerciseId tinyint not null,
    muscleId tinyint not null, 
    foreign key (exerciseId) references exercise(exerciseId),
    foreign key (muscleId) references muscle(muscleId)
);
 -- ********************************************************************************************




-- ********************************************************************************************
-- ************************************* POPULATE TABLES **************************************
-- ********************************************************************************************

-- populate muscleGroup table
insert into muscleGroup (muscleGroupId, name)
values
  (DEFAULT, 'upper'),
  (DEFAULT, 'core'),
  (DEFAULT, 'lower'),
  (DEFAULT, 'cardio');
-- ********************************************************************************************

-- populate equipment table
insert into equipment (equipmentId, name)

values 
    (DEFAULT, 'dumbbell'), 
    (DEFAULT, 'barbell'), 
    (DEFAULT, 'resistance bands'), 
    (DEFAULT, 'exercise ball'), 
    (DEFAULT, 'aerobic steps'), 
    (DEFAULT, 'ankle weights'), 
    (DEFAULT, 'medicine ball'), 
    (DEFAULT, 'jump rope'), 
    (DEFAULT, 'machine'), 
    (DEFAULT, 'none'), 
    (DEFAULT, 'kettlebell'), 
    (DEFAULT, 'bicycle'), 
    (DEFAULT, 'plate');
-- ********************************************************************************************

-- populate muscle table
insert into muscle (muscleId, name, muscleGroupId)

values
    (DEFAULT, 'shoulders', (select muscleGroupId from muscleGroup where name='upper')),
    (DEFAULT, 'triceps',(select muscleGroupId from muscleGroup where name='upper')),
    (DEFAULT, 'biceps',(select muscleGroupId from muscleGroup where name='upper')),
    (DEFAULT, 'lats',(select muscleGroupId from muscleGroup where name='upper')),
    (DEFAULT, 'chest',(select muscleGroupId from muscleGroup where name='upper')),
    (DEFAULT, 'abs',(select muscleGroupId from muscleGroup where name='core')),
    (DEFAULT, 'lower back',(select muscleGroupId from muscleGroup where name='core')),
    (DEFAULT, 'obliques',(select muscleGroupId from muscleGroup where name='core')),
    (DEFAULT, 'glutes',(select muscleGroupId from muscleGroup where name='lower')),
    (DEFAULT, 'calves',(select muscleGroupId from muscleGroup where name='lower')),
    (DEFAULT, 'inner thighs',(select muscleGroupId from muscleGroup where name='lower')),
    (DEFAULT, 'outer thighs',(select muscleGroupId from muscleGroup where name='lower')),
    (DEFAULT, 'quads',(select muscleGroupId from muscleGroup where name='lower')),
    (DEFAULT, 'heart',(select muscleGroupId from muscleGroup where name='cardio'));    
-- ********************************************************************************************


-- populate exercise table
insert into exercise (exerciseId, name, description, muscleGroup, equipmentId)

values
    -- ************************************** upper body *****************************************
    (DEFAULT, 'curls','Lift weight towards you',(select muscleGroupId from muscleGroup where name='upper'),(select equipmentId from equipment where name='dumbbell')),
    (DEFAULT, 'lat pulldown', 'Take weight and pull down', (select muscleGroupId from muscleGroup where name='upper'), (select equipmentId from equipment where name='machine')),
    (DEFAULT, 'tri kickbacks', 'Lift weight directly behind you', (select muscleGroupId from muscleGroup where name='upper'), (select equipmentId from equipment where name='ankle weights')),
    (DEFAULT, 'push ups', 'Go into plank position, lower body than push up ', (select muscleGroupId from muscleGroup where name='upper'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'shoulder press', 'Take weight and lift directly over head ', (select muscleGroupId from muscleGroup where name='upper'), (select equipmentId from equipment where name='barbell')),
    (DEFAULT, 'bench press', 'lie flat on back, hold weight parallel to your chest, arms are at 90 degreee angle, lift weight straight up, and then back to starting position, repeat',(select muscleGroupId from muscleGroup where name='upper'), (select equipmentId from equipment where name='machine')),
    (DEFAULT, 'chest press','use machine as directed', (select muscleGroupId from muscleGroup where name='upper'), (select equipmentId from equipment where name='machine')),
    
    -- ************************************** core: weighted *****************************************
    (DEFAULT, 'weighted crunches', 'lay on back, use core to crunch upward', (select muscleGroupId from muscleGroup where name='core'), (select equipmentId from equipment where name='medicine ball')),
    (DEFAULT, 'weighted bicycle crunches', 'laying in crunch position, motion legs like riding a bicycle, bringing shoulder to opposite knee', (select muscleGroupId from muscleGroup where name='core'), (select equipmentId from equipment where name='ankle weights')),
    (DEFAULT, 'weighted reverse crunches', 'laying on back, cross legs in the air and push feet upwards',(select muscleGroupId from muscleGroup where name='core') ,(select equipmentId from equipment where name='ankle weights')),
    (DEFAULT, 'weighted scissor kicks', 'lay on back, straighten legs and lift 6 inches off the floor, alternate crossing legs over each other', (select muscleGroupId from muscleGroup where name='core'), (select equipmentId from equipment where name='ankle weights')),
    (DEFAULT, 'weighted flutter kicks', 'lay on back, straighten legs and lift 6 inches off the floor, alternate kicking each leg', (select muscleGroupId from muscleGroup where name='core'),(select equipmentId from equipment where name='ankle weights')),
    (DEFAULT, 'weighted plank', 'get into push-up position, bending elbows at a 90 degree angle, and rest your weight on your foraems, straight back tight', (select muscleGroupId from muscleGroup where name='core'), (select equipmentId from equipment where name='plate')),
    (DEFAULT, 'weighted russian twists', 'sit on floor, lean back until body is in V shape, twist torso from left to right', (select muscleGroupId from muscleGroup where name='core'), (select equipmentId from equipment where name='medicine ball')),
    (DEFAULT, 'weighted hollow rock', 'lay on your back, extend arms straight over head, extend legs, lift arms and legs and rock back and forth', (select muscleGroupId from muscleGroup where name='core'), (select equipmentId from equipment where name='ankle weights')),
    (DEFAULT, 'weighted v-ups', 'lay on your back, extend arms straight over head, extend legs, crunch up by simultaneously lifting arms and legs towards each other', (select muscleGroupId from muscleGroup where name='core'), (select equipmentId from equipment where name='medicine ball')),
    (DEFAULT, 'weighted supermans', 'lay on your stomach, extend arms straight over head, extend legs, and simultaneously lift arms and legs', (select muscleGroupId from muscleGroup where name='core'), (select equipmentId from equipment where name='ankle weights')),
    
    -- ************************************** core: unweighted *****************************************
    (DEFAULT, 'crunches', 'lay on back, use core to crunch upward', (select muscleGroupId from muscleGroup where name='core'), (select equipmentId from equipment where name='medicine ball')),
    (DEFAULT, 'bicycle crunches', 'laying in crunch position, motion legs like riding a bicycle, bringing shoulder to opposite knee', (select muscleGroupId from muscleGroup where name='core'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'reverse crunches', 'laying on back, cross legs in the air and push feet upwards',(select muscleGroupId from muscleGroup where name='core' ),(select equipmentId from equipment where name='none')),
    (DEFAULT, 'scissor kicks', 'lay on back, straighten legs and lift 6 inches off the floor, alternate crossing legs over each other', (select muscleGroupId from muscleGroup where name='core'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'flutter kicks', 'lay on back, straighten legs and lift 6 inches off the floor, alternate kicking each leg', (select muscleGroupId from muscleGroup where name='core'),(select equipmentId from equipment where name='none')),
    (DEFAULT, 'plank', 'get into push-up position, bending elbows at a 90 degree angle, and rest your weight on your foraems, straight back tight', (select muscleGroupId from muscleGroup where name='core'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'russian twists', 'sit on floor, lean back until body is in V shape, twist torso from left to right', (select muscleGroupId from muscleGroup where name='core'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'hollow rock', 'lay on your back, extend arms straight over head, extend legs, lift arms and legs and rock back and forth', (select muscleGroupId from muscleGroup where name='core'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'v-ups', 'lay on your back, extend arms straight over head, extend legs, crunch up by simultaneously lifting arms and legs towards each other', (select muscleGroupId from muscleGroup where name='core'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'supermans', 'lay on your stomach, extend arms straight over head, extend legs, and simultaneously lift arms and legs', (select muscleGroupId from muscleGroup where name='core'), (select equipmentId from equipment where name='none')),
    
    -- ************************************** lower: weighted *****************************************
    (DEFAULT, 'weighted squats', 'same things as squats but with weights', (select muscleGroupId from muscleGroup where name='lower'), (select equipmentId from equipment where name='kettlebell')),
    (DEFAULT, 'weighted narrow squats', 'samething as narrow squats with weights', (select muscleGroupId from muscleGroup where name='lower'), (select equipmentId from equipment where name='kettlebell')),
    (DEFAULT, 'weighted plie squats', 'Similar to squats, except that your toes are pointed outward', (select muscleGroupId from muscleGroup where name='lower'), (select equipmentId from equipment where name='kettlebell')),
    (DEFAULT, 'weighted lunges', 'start off in an upright position feet together, then step forward then touch back knee to floor', (select muscleGroupId from muscleGroup where name='lower'), (select equipmentId from equipment where name='barbell')),
    (DEFAULT, 'weighted glute kickbacks plank', 'start in the plank postion, place one knee on the floor, then lift other leg directly behind you toes pointed upwards and moving leg up and down with out touching knee to the floor', (select muscleGroupId from muscleGroup where name='lower'), (select equipmentId from equipment where name='ankle weights')),
    (DEFAULT, 'weighted fire hydrants','Get in doggie postion(hands and knees, then lift one leg) and open your legs wide to a 90 degree position(like youre trying to pee on a hydrant)', (select muscleGroupId from muscleGroup where name='lower'), (select equipmentId from equipment where name='ankle weights')),
    (DEFAULT, 'leg curl','Use machince as directed', (select muscleGroupId from muscleGroup where name='lower'), (select equipmentId from equipment where name='machine')),
    
    
    -- ************************************** lower: unweighted *****************************************
    (DEFAULT, 'squats', 'start in upright position, legs shouder width appart, then squat in a sitting positoin, chest, knees behind toes', (select muscleGroupId from muscleGroup where name='lower'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'narrow squats', 'samething as squats but feet are together instead of shoulder width apart', (select muscleGroupId from muscleGroup where name='lower'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'plie squats', 'Similar to squats, except that your toes are pointed outward', (select muscleGroupId from muscleGroup where name='lower'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'lunges', 'start off in an upright position feet together, then step forward then touch back knee to floor', (select muscleGroupId from muscleGroup where name='lower'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'glute kickbacks plank', 'start in the plank postion, place one knee on the floor, then lift other leg directly behind you toes pointed upwards and moving leg up and down with out touching knee to the floor', (select muscleGroupId from muscleGroup where name='lower'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'fire hydrants','Get in doggie postion(hands and knees, then lift one leg) and open your legs wide to a 90 degree position(like youre trying to pee on a hydrant)', (select muscleGroupId from muscleGroup where name='lower'), (select equipmentId from equipment where name='none')),
   
    -- ************************************** cardio: weighted *****************************************
    (DEFAULT, 'weighted burpees', 'jump up, land, drop down into push-up position, do a push up, jump into a squat postion, then repeat', (select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='ankle weights')),
    (DEFAULT, 'weighted run', 'run, Forest, run!', (select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='ankle weights')),
    (DEFAULT, 'weighted jog', 'a run but slower', (select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='ankle weights')),
    (DEFAULT, 'weighted high knees', 'run in place, lifting knees as close to hip height', (select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='ankle weights')),
    (DEFAULT, 'weighted stairs', 'Run up and down a set of stairs without falling, or breaking shins', (select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='ankle weights')),
    (DEFAULT, 'weighted jumping jacks', 'start in upright position with feet together, then jump into a eiffle tower position, and continue to get jump back and forth between positions', (select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='ankle weights')),
    (DEFAULT, 'weighted sprints', 'Run Faster',(select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='ankle weights')),
    (DEFAULT, 'weighted suicides', 'Run Faster',(select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='ankle weights')),

    -- ************************************** cardio: unweighted *****************************************
    (DEFAULT, 'burpees', 'jump up, land, drop down into push-up position, do a push up, jump into a squat postion, then repeat', (select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'run', 'You run like your life depends on it!', (select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'jog', 'a run but slower', (select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'high knees', 'run in place, lifting knees as close to hip height', (select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'jump rope', 'Start with jump rope behind you, touch your elbows to your sides, then swing rope in circular motion while you jump over rope when it comes to your feet', (select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='jump rope')),
    (DEFAULT, 'stairs', 'Run up and down a set of stairs without falling, or breaking shins', (select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'jumping jacks', 'start in upright position with feet together, then jump into a eiffle tower position, and continue to get jump back and forth between positions', (select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'bicycles', 'get on a bicycle and ride', (select muscleGroupId from muscleGroup where name='cardio'),(select equipmentId from equipment where name='bicycle')),
    (DEFAULT, 'sprints', 'Run Faster',(select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='none')),
    (DEFAULT, 'suicides', 'goodbye cruel world', (select muscleGroupId from muscleGroup where name='cardio'), (select equipmentId from equipment where name='jump rope'));
-- ********************************************************************************************

-- populate exerciseMuscle table
 insert into exerciseMuscle (exerciseId, muscleId)

 values
    -- ************************************** upper body *****************************************
    ((select exerciseId from exercise where name = 'curls'), (select muscleId from muscle where name = 'biceps')),
    ((select exerciseId from exercise where name = 'lat pulldown'), (select muscleId from muscle where name = 'lats')),
    ((select exerciseId from exercise where name = 'lat pulldown'), (select muscleId from muscle where name = 'biceps')),
    ((select exerciseId from exercise where name = 'tri kickbacks'), (select muscleId from muscle where name = 'triceps')),
    ((select exerciseId from exercise where name = 'tri kickbacks'), (select muscleId from muscle where name = 'biceps')),
    ((select exerciseId from exercise where name = 'push ups'), (select muscleId from muscle where name = 'chest')),
    ((select exerciseId from exercise where name = 'push ups'), (select muscleId from muscle where name = 'biceps')),
    ((select exerciseId from exercise where name = 'push ups'), (select muscleId from muscle where name = 'triceps')),
    ((select exerciseId from exercise where name = 'shoulder press'), (select muscleId from muscle where name = 'shoulders')),
    ((select exerciseId from exercise where name = 'shoulder press'), (select muscleId from muscle where name = 'triceps')),
    ((select exerciseId from exercise where name = 'bench press'), (select muscleId from muscle where name = 'chest')),
    ((select exerciseId from exercise where name = 'bench press'), (select muscleId from muscle where name = 'triceps')),
    ((select exerciseId from exercise where name = 'bench press'), (select muscleId from muscle where name = 'shoulders')),
    ((select exerciseId from exercise where name = 'chest press'), (select muscleId from muscle where name = 'chest')),
    ((select exerciseId from exercise where name = 'chest press'), (select muscleId from muscle where name = 'triceps')),
    ((select exerciseId from exercise where name = 'chest press'), (select muscleId from muscle where name = 'biceps')),

    -- ************************************** core: weighted *****************************************
    ((select exerciseId from exercise where name = 'weighted crunches'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'weighted bicycle crunches'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'weighted bicycle crunches'), (select muscleId from muscle where name = 'obliques')),
    ((select exerciseId from exercise where name = 'weighted reverse crunches'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'weighted scissor kicks'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'weighted flutter kicks'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'weighted plank'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'weighted plank'), (select muscleId from muscle where name = 'shoulders')),
    ((select exerciseId from exercise where name = 'weighted plank'), (select muscleId from muscle where name = 'obliques')),
    ((select exerciseId from exercise where name = 'weighted russian twists'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'weighted russian twists'), (select muscleId from muscle where name = 'obliques')),
    ((select exerciseId from exercise where name = 'weighted hollow rock'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'weighted v-ups'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'weighted supermans'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'weighted supermans'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'weighted supermans'), (select muscleId from muscle where name = 'lower back')),
    
    -- ************************************** core: unweighted *****************************************
    ((select exerciseId from exercise where name = 'crunches'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'bicycle crunches'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'bicycle crunches'), (select muscleId from muscle where name = 'obliques')),
    ((select exerciseId from exercise where name = 'reverse crunches'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'scissor kicks'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'flutter kicks'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'plank'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'plank'), (select muscleId from muscle where name = 'shoulders')),
    ((select exerciseId from exercise where name = 'plank'), (select muscleId from muscle where name = 'obliques')),
    ((select exerciseId from exercise where name = 'russian twists'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'russian twists'), (select muscleId from muscle where name = 'obliques')),
    ((select exerciseId from exercise where name = 'hollow rock'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'v-ups'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'supermans'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'supermans'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'supermans'), (select muscleId from muscle where name = 'lower back')),
    
    -- ************************************** lower: unweighted *****************************************
    ((select exerciseId from exercise where name = 'squats'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'squats'), (select muscleId from muscle where name = 'quads')),
    
    ((select exerciseId from exercise where name = 'narrow squats'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'narrow squats'), (select muscleId from muscle where name = 'outer thighs')),
    ((select exerciseId from exercise where name = 'narrow squats'), (select muscleId from muscle where name = 'quads')),
    
    ((select exerciseId from exercise where name = 'plie squats'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'plie squats'), (select muscleId from muscle where name = 'inner thighs')),
    ((select exerciseId from exercise where name = 'plie squats'), (select muscleId from muscle where name = 'quads')),
    
    ((select exerciseId from exercise where name = 'lunges'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'lunges'), (select muscleId from muscle where name = 'quads')),

    ((select exerciseId from exercise where name = 'glute kickbacks plank'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'glute kickbacks plank'), (select muscleId from muscle where name = 'shoulders')),
    ((select exerciseId from exercise where name = 'glute kickbacks plank'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'glute kickbacks plank'), (select muscleId from muscle where name = 'lower back')),
    
    ((select exerciseId from exercise where name = 'fire hydrants'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'fire hydrants'), (select muscleId from muscle where name = 'outer thighs')),
    
    -- ************************************** lower: weighted *****************************************
    ((select exerciseId from exercise where name = 'weighted squats'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'weighted squats'), (select muscleId from muscle where name = 'quads')),
    
    ((select exerciseId from exercise where name = 'weighted narrow squats'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'weighted narrow squats'), (select muscleId from muscle where name = 'outer thighs')),
    ((select exerciseId from exercise where name = 'weighted narrow squats'), (select muscleId from muscle where name = 'quads')),
    
    ((select exerciseId from exercise where name = 'weighted plie squats'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'weighted plie squats'), (select muscleId from muscle where name = 'inner thighs')),
    ((select exerciseId from exercise where name = 'weighted plie squats'), (select muscleId from muscle where name = 'quads')),
    
    ((select exerciseId from exercise where name = 'weighted lunges'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'weighted lunges'), (select muscleId from muscle where name = 'quads')),

    ((select exerciseId from exercise where name = 'weighted glute kickbacks plank'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'weighted glute kickbacks plank'), (select muscleId from muscle where name = 'shoulders')),
    ((select exerciseId from exercise where name = 'weighted glute kickbacks plank'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'weighted glute kickbacks plank'), (select muscleId from muscle where name = 'lower back')),
    
    ((select exerciseId from exercise where name = 'weighted fire hydrants'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'weighted fire hydrants'), (select muscleId from muscle where name = 'outer thighs')),
    
    ((select exerciseId from exercise where name = 'leg curl'), (select muscleId from muscle where name = 'glutes')),
    
    -- ************************************** cardio: weighted *****************************************
    ((select exerciseId from exercise where name = 'weighted burpees'), (select muscleId from muscle where name = 'heart')),
    ((select exerciseId from exercise where name = 'weighted burpees'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'weighted burpees'), (select muscleId from muscle where name = 'chest')),
    ((select exerciseId from exercise where name = 'weighted burpees'), (select muscleId from muscle where name = 'quads')),
    ((select exerciseId from exercise where name = 'weighted burpees'), (select muscleId from muscle where name = 'glutes')),
    
    ((select exerciseId from exercise where name = 'weighted run'), (select muscleId from muscle where name = 'heart')),
    ((select exerciseId from exercise where name = 'weighted run'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'weighted run'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'weighted run'), (select muscleId from muscle where name = 'calves')),
    
    ((select exerciseId from exercise where name = 'weighted jog'), (select muscleId from muscle where name = 'heart')),
    ((select exerciseId from exercise where name = 'weighted jog'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'weighted jog'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'weighted jog'), (select muscleId from muscle where name = 'calves')),
    
    ((select exerciseId from exercise where name = 'weighted high knees'), (select muscleId from muscle where name = 'heart')),
    ((select exerciseId from exercise where name = 'weighted high knees'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'weighted high knees'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'weighted high knees'), (select muscleId from muscle where name = 'quads')),
    
    ((select exerciseId from exercise where name = 'weighted stairs'), (select muscleId from muscle where name = 'heart')),
    ((select exerciseId from exercise where name = 'weighted stairs'), (select muscleId from muscle where name = 'quads')),
    ((select exerciseId from exercise where name = 'weighted stairs'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'weighted stairs'), (select muscleId from muscle where name = 'calves')),
    
    ((select exerciseId from exercise where name = 'weighted jumping jacks'), (select muscleId from muscle where name = 'calves')),
    ((select exerciseId from exercise where name = 'weighted jumping jacks'), (select muscleId from muscle where name = 'heart')),
    
    ((select exerciseId from exercise where name = 'weighted sprints'), (select muscleId from muscle where name = 'heart')),
    ((select exerciseId from exercise where name = 'weighted sprints'), (select muscleId from muscle where name = 'quads')),
    ((select exerciseId from exercise where name = 'weighted sprints'), (select muscleId from muscle where name = 'calves')),
    
    ((select exerciseId from exercise where name = 'weighted suicides'), (select muscleId from muscle where name = 'heart')),
    ((select exerciseId from exercise where name = 'weighted suicides'), (select muscleId from muscle where name = 'quads')),
    ((select exerciseId from exercise where name = 'weighted suicides'), (select muscleId from muscle where name = 'calves')),
    
    -- ************************************** cardio: unweighted *****************************************
    ((select exerciseId from exercise where name = 'burpees'), (select muscleId from muscle where name = 'heart')),
    ((select exerciseId from exercise where name = 'burpees'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'burpees'), (select muscleId from muscle where name = 'chest')),
    ((select exerciseId from exercise where name = 'burpees'), (select muscleId from muscle where name = 'quads')),
    ((select exerciseId from exercise where name = 'burpees'), (select muscleId from muscle where name = 'glutes')),
    
    ((select exerciseId from exercise where name = 'run'), (select muscleId from muscle where name = 'heart')),
    ((select exerciseId from exercise where name = 'run'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'run'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'run'), (select muscleId from muscle where name = 'calves')),
    
    ((select exerciseId from exercise where name = 'jog'), (select muscleId from muscle where name = 'heart')),
    ((select exerciseId from exercise where name = 'jog'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'jog'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'jog'), (select muscleId from muscle where name = 'calves')),
    
    ((select exerciseId from exercise where name = 'high knees'), (select muscleId from muscle where name = 'heart')),
    ((select exerciseId from exercise where name = 'high knees'), (select muscleId from muscle where name = 'abs')),
    ((select exerciseId from exercise where name = 'high knees'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'high knees'), (select muscleId from muscle where name = 'quads')),
    
    ((select exerciseId from exercise where name = 'jump rope'), (select muscleId from muscle where name = 'heart')),
    ((select exerciseId from exercise where name = 'jump rope'), (select muscleId from muscle where name = 'calves')),
    
    ((select exerciseId from exercise where name = 'stairs'), (select muscleId from muscle where name = 'heart')),
    ((select exerciseId from exercise where name = 'stairs'), (select muscleId from muscle where name = 'quads')),
    ((select exerciseId from exercise where name = 'stairs'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'stairs'), (select muscleId from muscle where name = 'calves')),
    
    ((select exerciseId from exercise where name = 'jumping jacks'), (select muscleId from muscle where name = 'calves')),
    ((select exerciseId from exercise where name = 'jumping jacks'), (select muscleId from muscle where name = 'heart')),
    
    ((select exerciseId from exercise where name = 'bicycles'), (select muscleId from muscle where name = 'heart')),
    ((select exerciseId from exercise where name = 'bicycles'), (select muscleId from muscle where name = 'quads')),
    ((select exerciseId from exercise where name = 'bicycles'), (select muscleId from muscle where name = 'glutes')),
    ((select exerciseId from exercise where name = 'bicycles'), (select muscleId from muscle where name = 'calves')),
    
    ((select exerciseId from exercise where name = 'sprints'), (select muscleId from muscle where name = 'heart')),
    ((select exerciseId from exercise where name = 'sprints'), (select muscleId from muscle where name = 'quads')),
    ((select exerciseId from exercise where name = 'sprints'), (select muscleId from muscle where name = 'calves')),
    
    ((select exerciseId from exercise where name = 'suicides'), (select muscleId from muscle where name = 'heart')),
    ((select exerciseId from exercise where name = 'suicides'), (select muscleId from muscle where name = 'quads')),
    ((select exerciseId from exercise where name = 'suicides'), (select muscleId from muscle where name = 'calves'));