
.. _ref-objbatch:

============
objMakeBatch
============

::
   
   % OBJMAKEBATCH
   %
   % Usage: STATUS = objMakeBatch(MODULATION,PRM,[IGNORE_ERRORS])
   %        STATUS = objMakeBatch(MODULATION,FILENAME,[IGNORE_ERRORS])
   %
   % Create objects in a batch.  
   %
   % INPUT
   % =====
   % 
   % The first input argument, MODULATION, is a string defining the
   % type of modulation/perturbation to the base shape.  Possible
   % values are 'sine', 'noise', 'bump', and 'custom'.
   %
   % In the first form,
   %  > STATUS = objMakeBatch(MODULATION,PRM)
   % PRM is a cell array of cell arrays.  Each cell defines the
   % parameters for a single model.  The contents of each cell is exactly
   % what you would give as input to the corresponding objMake*-function.
   % For example, the following two calls:
   %  > objMakeSine('sphere',[8 .05 60 0],'sphere1.obj');
   %  > objMakeSine('cylinder',[4 .1 0 0],'cylinder1.obj');
   % are equivalent to the single call:
   %  > prm = {{'sphere',[8 .05 60 0],'sphere1.obj'},{'cylinder',[4 .1 0 0],'cylinder1.obj'}};
   %  > objMakeSine(prm);
   %
   % In the second form, 
   %  > STATUS = objMakeBatch(MODULATION,FILENAME)
   % FILENAME is the name of an .m-file defining the modulation
   % parameters.  This file has to be a script (not a function),
   % defining a single cell array named 'prm'.  The cells of this cell
   % array give the modulation parameters just as with the first form of
   % the function above.  The equivalent of the example above would be
   % to save the following to a file named, say, 'batchprm.m':
   % 
   %   prm = {
   %          {'sphere',[8 .05 60 0],'sphere1.obj'},
   %          {'cylinder',[4 .1 0 0],'cylinder1.obj'}
   %         };
   %
   % and then calling objMakeSine as:
   % > objMakeSine('batchprm.m');
   % 
   % The optional input argument IGNORE_ERRORS is a boolean.  If true,
   % the batch processing continues to the next model when an error
   % occurs with one set of parameters.  If false (default),
   % processing stops and an error is raised.  
   % 
   % RETURNS
   % =======
   % 
   % When IGNORE_ERRORS is true, the output argument STATUS is 1 if any
   % errors occurred.  If all shapes were completed successfully,
   % STATUS is always 0.
