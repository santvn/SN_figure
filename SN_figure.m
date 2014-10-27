function SN_figure(varargin)
%SN_FIGURE is an extension of FIGURE where it also adds the source of
% creation of the figure
%
%   SN_FIGURE, by itself, uses FIGURE to create a new figure window, 
%   and returns its handle.
% 
%   SN_FIGURE(H) makes H the current figure, forces it to become visible,
%   and raises it above all other figures on the screen.  If Figure H
%   does not exist, and H is an integer, a new figure is created with
%   handle H.
%   
%   SN_FIGURE(...,'OPTIONS',OPT_VAL) allows users to add more advance
%   options
%   The OPTIONS are:
%       'MFILENAME' or 'FNAME':  the name of the m-file that execute the
%           figure
%       'MFILELINE' or 'LINE':  the line number from the the m-file that
%           execute the figure
%
% See also FIGURE, SN_PRINTFIG
%
% Created by San Nguyen 2014 10 26
%

mFileName = '';
mFileLine = NaN;

persistent argsNameToCheck;
if isempty(argsNameToCheck);
    argsNameToCheck = {'mFileName','mFileLine','line','fName'};
end

index = 1;
n_items = nargin;
otherVarargin = {};
j = 0;
while (n_items > 0)
    argsMatch = strcmpi(varargin{index},argsNameToCheck);
    i = find(argsMatch,1);
    if isempty(i)
        j = j+1;
        otherVarargin{j} = varargin{index};
        index = index +1;
        n_items = n_items-1;
        continue;
    end
    
    switch i
        case {1,4} % mFileName
            if n_items == 1
                error('MATLAB:SN_figure:missingArgs','Missing input arguments');
            end
            mFileName = varargin{index+1};
            if isempty(mFileName) || ~ischar(mFileName)
                error('MATLAB:SN_figure:mFileName','Please check your mFileName');
            end
            index = index +2;
            n_items = n_items-2;
        case {2,3} % mFileLine
            if n_items == 1
                error('MATLAB:SN_figure:missingArgs','Missing input arguments');
            end
            mFileLine = varargin{index+1};
            if ~(isscalar(mFileLine) && isnumeric(mFileLine))
                error('MATLAB:SN_figure:mFileLine','Please check your mFileLine');
            end
            index = index +2;
            n_items = n_items-2;
    end
end


fig = figure(otherVarargin{:});
[ST,~] = dbstack('-completenames');

for i=1:numel(ST)
    if strncmp(ST(i).name,'SN_figure',9)
        continue;
    else
        tmp = ST(i).name;
        ind = strfind(tmp,'/');
        mFileLine = ST(i).line;
        if isempty(ind)
            mFileName = tmp;
        else
            mFileName = tmp(1:ind(1)-1);
        end
        break;
    end
end

figDate = now;

set(fig,...
    'UserData',struct('mfilename',mFileName,'line',mFileLine,'date',figDate));

end