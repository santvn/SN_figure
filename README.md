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
%       'WIDTH' or 'W': width of figure
%       'HEIGHT' or 'H': height of figure
%       'X', 'Y': x or y position of figure, respectively
%
% See also FIGURE, SN_PRINTFIG
%
% Created by San Nguyen 2014 10 26
% Updated by San Nguyen 2014 11 05
%